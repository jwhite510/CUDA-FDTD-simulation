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

void MakeGaussian(array2d<double> &gaussian){
  // linspace x and y
  vector<double>x(gaussian.size_0, 0);
  Linspace(x,-1,1);

  vector<double>y(gaussian.size_1, 0);
  Linspace(y,-1,1);

  double w=0.01;
  for(int i=0; i < gaussian.size_0; i++){
    for(int j=0; j < gaussian.size_1; j++){
      gaussian(i,j) = exp(-pow(x[i],2)/w)*exp(-pow(y[j],2)/w);
    }
  }
}
struct E_s{
  array3d<double> E_x;
  array3d<double> E_y;
  array3d<double> E_z;
  int N_x;
  int N_y;
  int N_z;
  E_s(int N_x, int N_y, int N_z):
    N_x(N_x),
    N_y(N_y),
    N_z(N_z),
    E_x(N_x,N_y+1,N_z+1),
    E_y(N_x+1,N_y,N_z+1),
    E_z(N_x+1,N_y+1,N_z)
  {
    E_x.init(0);
    E_y.init(0);
    E_z.init(0);
  }
};
struct H_s{
  array3d<double> H_x;
  array3d<double> H_y;
  array3d<double> H_z;
  int N_x;
  int N_y;
  int N_z;
  H_s(int N_x, int N_y, int N_z):
    N_x(N_x),
    N_y(N_y),
    N_z(N_z),
    H_x(N_x+1,N_y,N_z),
    H_y(N_x,N_y+1,N_z),
    H_z(N_x,N_y,N_z+1)
    {
      H_x.init(0);
      H_y.init(0);
      H_z.init(0);
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
struct J_s{
  array3d<double> J_x;
  array3d<double> J_y;
  array3d<double> J_z;
  int N_x;
  int N_y;
  int N_z;
  J_s(int N_x, int N_y, int N_z):
    N_x(N_x),
    N_y(N_y),
    N_z(N_z),
    J_x(N_x+1,N_y,N_z),
    J_y(N_x,N_y+1,N_z),
    J_z(N_x,N_y,N_z+1)
    {
      J_x.init(0);
      J_y.init(0);
      J_z.init(0);
    }

};

void E_from_H(E_s &E, H_s &H, J_s &J, Params &P){

  for(int i=1; i < E.N_x-1; i++){
    for(int j=1; j < E.N_y-1; j++){
      for(int k=1; k < E.N_z-1; k++){

        double Ec = (1/P.eps0)*(P.dt/P.dx);
        double Jc = (1/P.eps0)*P.dt;

        E.E_x(i,j,k) = E.E_x(i,j,k) +
          Ec*(
            (H.H_z(i,j,k) - H.H_z(i,j,k))
          - (H.H_y(i,j,k) - H.H_y(i,j,k))
          );
        E.E_x(i,j,k) -= Jc*J.J_x(i,j,k);

        E.E_y(i-1,j+1,k) = E.E_y(i-1,j+1,k) +
          Ec*(
            (H.H_x(i-1,j+1,k+1) - H.H_x(i-1,j+1,k))
          - (H.H_z(i,j+1,k) - H.H_z(i-1,j+1,k))
          );
        E.E_y(i-1,j+1,k) -= Jc*J.J_y(i-1,j+1,k);

        E.E_z(i-1,j,k+1) = E.E_z(i-1,j,k+1) +
          Ec*(
            (H.H_y(i,j,k+1) - H.H_y(i-1,j,k+1))
          - (H.H_x(i-1,j+1,k+1) - H.H_x(i-1,j,k+1))
          );
        E.E_z(i-1,j,k+1) -= Jc*J.J_z(i-1,j,k+1);

        double jvalx = (P.dt/P.eps0)*J.J_x(i,j,k);
        double jvaly = (P.dt/P.eps0)*J.J_y(i,j,k);
        double jvalz = (P.dt/P.eps0)*J.J_z(i,j,k);

      }
    }
  }
}
void H_from_E(H_s &H, E_s &E, Params &P){

  double Hc = (1/P.mu0)*(P.dt/P.dx);

  for(int i=1; i < E.N_x-1; i++){
    for(int j=1; j < E.N_y-1; j++){
      for(int k=1; k < E.N_z-1; k++){

        H.H_x(i-1,j+1,k+1) = H.H_x(i-1,j+1,k+1) +
          Hc*(
            ((E.E_y(i-1,j+1,k+1) - E.E_y(i-1,j+1,k)))
          - ((E.E_z(i-1,j+1,k+1) - E.E_z(i-1,j,k+1)))
          );

        H.H_y(i,j,k+1) = H.H_y(i,j,k+1) +
          Hc*(
            ((E.E_z(i,j,k+1) - E.E_z(i-1,j,k+1)))
          - ((E.E_x(i,j,k+1) - E.E_x(i,j,k)))
          );

        H.H_z(i,j+1,k) = H.H_z(i,j+1,k) +
          Hc*(
            ((E.E_x(i,j+1,k) - E.E_x(i,j,k)))
          - ((E.E_y(i,j+1,k) - E.E_y(i-1,j+1,k)))
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

  E_s E(N_x, N_y, N_z);
  H_s H(N_x, N_y, N_z);
  J_s J(N_x, N_y, N_z);

  double c=2.998e8;
  Params P;
  P.mu0 = 4*M_PI*10e-7;
  P.eps0 = 8.85e-12;
  P.dx = 50e-9;
  P.dy = 50e-9;
  P.dz = 50e-9;
  P.dt = (50e-9)/(2*c);
  double freq=500e12;
  double omega = 2*M_PI*freq;

  PythonInterp Python("/home/zom/Projects/diffraction_net/venv/", "utility");

  array2d<double> gaussian(N_x+1,N_y);
  MakeGaussian(gaussian);

  double t=0;
  for(int i=0;i<300;i++){
    t+=P.dt;

    for(int i=0; i < J.J_x.size_0; i++){
      for(int j=0; j < J.J_x.size_1; j++){
        for(int k=0; k < J.J_x.size_2; k++){
          // J.J_z(i,j,k) = cos(omega*t)*gaussian(i,j);
          J.J_z(i,j,k)=cos(omega*t)*exp(-(pow(i-50,2)/2))*exp(-(pow(j-50,2)/2))*exp(-(pow(k-50,2)/2));
        }
      }
    }
    cout << "t => " << t << endl;
    // Python.call_function_np("plot", J.J_z.data, vector<int>{J.J_z.size_0,J.J_z.size_1,H.H_z.size_2}, PyArray_FLOAT64);

    E_from_H(E, H, J, P);
    H_from_E(H, E, P);


    Python.call_function_np("plot", H.H_x.data, vector<int>{H.H_x.size_0,H.H_x.size_1,H.H_x.size_2}, PyArray_FLOAT64);
    Python.call("show");

  }




}



