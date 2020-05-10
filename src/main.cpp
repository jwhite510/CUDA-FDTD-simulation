#include<iostream>
#include<vector>
#include"pythonarrays.h"
#include"c_arrays.h"
#include<fstream>

// void E_from_H()

void Linspace(vector<double> &vec, double min, double max)
{
  int N = vec.size();
  double length = max - min;
  double dx = length / N;
  double val = min;
  for(int i=0; i < vec.size(); i++){
    vec[i]=val;
    val+=dx;
  }
}

void MakeGaussian(array3d<double> &gaussian){
  // linspace x and y
  vector<double>x(gaussian.size_0, 0);
  Linspace(x,-1,1);

  vector<double>y(gaussian.size_1, 0);
  Linspace(y,-1,1);

  vector<double>z(gaussian.size_2, 0);
  Linspace(z,-1,1);

  double w=0.01;
  for(int i=0; i < gaussian.size_0; i++)
    for(int j=0; j < gaussian.size_1; j++)
      for(int k=0; k < gaussian.size_2; k++)
        gaussian(i,j,k) = exp(-pow(x[i],2)/w)*exp(-pow(y[j],2)/w)*exp(-pow(z[k],2)/w);

}
struct Tensor{
  array3d<double> x;
  array3d<double> y;
  array3d<double> z;
  int N_x;
  int N_y;
  int N_z;
  double C; // coefficient
  Tensor(int N_x, int N_y, int N_z):
    N_x(N_x),
    N_y(N_y),
    N_z(N_z),
    x(N_x,N_y,N_z),
    y(N_x,N_y,N_z),
    z(N_x,N_y,N_z)
  {
    x.init(0);
    y.init(0);
    z.init(0);
  }
};
struct Params{
  double dt;
  double eps0;
  double mu0;
  double dy;
  double dx;
  double dz;
};

void E_from_H(Tensor &E, Tensor &H, Tensor &J, Params &P){

  for(int i=1; i < E.N_x-1; i++){
    for(int j=1; j < E.N_y-1; j++){
      for(int k=1; k < E.N_z-1; k++){

        E.x(i,j,k) = E.x(i,j,k) +
          (P.dt/P.eps0)*(
            (H.z(i,j+1,k) - H.z(i,j,k))/P.dy
          - (H.y(i,j,k+1) - H.y(i,j,k))/P.dz
          - J.x(i,j,k)
          );

        E.y(i-1,j+1,k) = E.y(i-1,j+1,k) +
          (P.dt/P.eps0)*(
            (H.x(i-1,j+1,k+1) - H.x(i-1,j+1,k))/P.dz
          - (H.z(i,j+1,k) - H.z(i-1,j+1,k))/P.dx
          -J.y(i-1,j+1,k)
          );

        E.z(i-1,j,k+1) = E.z(i-1,j,k+1) +
          (P.dt*P.eps0)*(
            (H.y(i,j,k+1) - H.y(i-1,j,k+1))/P.dx
          - (H.x(i-1,j+1,k+1) - H.x(i-1,j,k+1))/P.dy
          -J.z(i-1,j,k+1)
          );
      }
    }
  }
}
void H_from_E(Tensor &H, Tensor &E, Params &P){

  for(int i=1; i < E.N_x-1; i++){
    for(int j=1; j < E.N_y-1; j++){
      for(int k=1; k < E.N_z-1; k++){

        H.x(i-1,j+1,k+1) = H.x(i-1,j+1,k+1) +
          (P.dt/P.mu0)*(
            ((E.y(i-1,j+1,k+1) - E.y(i-1,j+1,k))/P.dz)
          - ((E.z(i-1,j+1,k+1) - E.z(i-1,j,k+1))/P.dy)
          );

        H.y(i,j,k+1) = H.y(i,j,k+1) +
          (P.dt/P.mu0)*(
            ((E.z(i,j,k+1) - E.z(i-1,j,k+1))/P.dx)
          - ((E.x(i,j,k+1) - E.x(i,j,k))/P.dz)
          );

        H.z(i,j+1,k) = H.z(i,j+1,k) +
          (P.dt/P.mu0)*(
            ((E.x(i,j+1,k) - E.x(i,j,k))/P.dy)
          - ((E.y(i,j+1,k) - E.y(i-1,j+1,k))/P.dx)
          );
      }
    }
  }
}
int main()
{
  std::cout << "hello" << std::endl;
  // make arrays
  int N_x = 100;
  int N_y = 100;
  int N_z = 100;

  Tensor E(N_x, N_y, N_z);
  Tensor H(N_x, N_y, N_z);
  Tensor J(N_x, N_y, N_z);

  double c=2.998e8;
  Params P;
  P.mu0 = 4*M_PI*10e-7;
  P.eps0 = 8.85e-12;
  P.dx = 50e-9;
  P.dy = 50e-9;
  P.dz = 50e-9;
  P.dt = (50e-9)/2*c;

  // double c=1;
  // Params P;
  // P.mu0 = 1;
  // P.eps0 = 1;
  // P.dx = 1;
  // P.dy = 1;
  // P.dz = 1;
  // P.dt = 0.1;

  PythonInterp Python("/home/zom/Projects/diffraction_net/venv/", "utility");

  array3d<double> gaussian(N_x,N_y,N_z);
  MakeGaussian(gaussian);

  // Python.call_function_np("plotgaussian", gaussian.data, vector<int>{gaussian.size_0,gaussian.size_1,gaussian.size_2}, PyArray_FLOAT64);
  // exit(0);

  double t=0;
  for(int i=0;i<300;i++){
    t+=P.dt;

    for(int i=0; i < J.x.size_0; i++){
      for(int j=0; j < J.x.size_1; j++){
        for(int k=0; k < J.x.size_2; k++){
          J.x(i,j,k) = cos(t)*gaussian(i,j,k);
        }
      }
    }
    cout << "t => " << t << endl;
    Python.call_function_np("plotJX", J.x.data, vector<int>{J.x.size_0,J.x.size_1,J.x.size_2}, PyArray_FLOAT64);

    E_from_H(E, H, J, P);
    H_from_E(H, E, P);

    Python.call_function_np("plot", H.z.data, vector<int>{H.z.size_0,H.z.size_1,H.z.size_2}, PyArray_FLOAT64);
    Python.call("show");

    // getchar();

  }




}



