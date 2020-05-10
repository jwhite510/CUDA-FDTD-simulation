#include<iostream>
#include<vector>
#include"pythonarrays.h"
#include"c_arrays.h"
#include<fstream>

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

int main()
{
  std::cout << "hello" << std::endl;
  // make arrays
  int N_x = 100;
  int N_y = 100;
  int N_z = 100;
  int GridLength=N_x;
  array3d<double> eps_rel(N_x, N_y, N_z);
  eps_rel.init(1); // initialize to ones

  double time_span=15e-15;
  double dr=50e-9;
  double freq=500e12;
  double tau=1e-15;

  double c=2.99792458e8;
  double munot=4*M_PI*1e-7;
  double epsnot=1/((pow(c,2))*munot);
  double dt=dr/(2*c);
  int tmax_steps=time_span/dt;
  double omega = 2*M_PI*freq;

  Tensor E(N_x, N_y, N_z);
  Tensor H(N_x, N_y, N_z);
  Tensor J(N_x, N_y, N_z);
  E.C = (1/epsnot)*(dt/dr);
  H.C = (1/munot)*(dt/dr);
  J.C = (1/epsnot)*dt;

  // define gaussian
  for(int i=0; i < N_x; i++)
    for(int j=0; j < N_y; j++)
      for(int k=0; k < N_z; k++)
        J.z(i,j,k)=exp(-(pow(i-50,2)/2))*exp(-(pow(j-50,2)/2))*exp(-(pow(k-50,2)/2));

  PythonInterp Python("/home/zom/Projects/diffraction_net/venv/", "utility");
  // Python.call_function_np("plotgaussian", J.z.data, vector<int>{J.z.size_0,J.z.size_1,J.z.size_2}, PyArray_FLOAT64);
  // exit(0);
  for(int n=0; n < tmax_steps; n++){
      
      for (int i=1;i<GridLength-2;i++)
          for (int j=1;j<GridLength-2;j++)
              for (int k=1;k<GridLength-2;k++)
                  E.x(i,j,k)=E.x(i,j,k)+E.C*(H.z(i,j,k)-H.z(i,j-1,k))-E.C*(H.y(i,j,k)-H.y(i,j,k-1));
      for (int i=1;i<GridLength-2;i++)
          for (int j=1;j<GridLength-2;j++)
              for (int k=1;k<GridLength-2;k++)
                  E.y(i,j,k)=E.y(i,j,k)+E.C*(H.x(i,j,k)-H.x(i,j,k-1))-E.C*(H.z(i,j,k)-H.z(i-1,j,k));
      for (int i=1;i<GridLength-2;i++)
          for (int j=1;j<GridLength-2;j++)
              for (int k=1;k<GridLength-2;k++)
                  E.z(i,j,k)=E.z(i,j,k)+E.C*(H.y(i,j,k)-H.y(i-1,j,k))-E.C*(H.x(i,j,k)-H.x(i,j-1,k));

      for(int i=1; i < GridLength-2; i++)
        for(int j=1; j < GridLength-2; j++)
          for(int k=1; k < GridLength-2; k++){
            E.x(i,j,k) = E.x(i,j,k) - J.C*J.x(i,j,k)*cos(omega*n*dt-3*tau)*exp(-(pow(n*dt-3*tau,2))/pow((tau),2));
            E.y(i,j,k) = E.y(i,j,k) - J.C*J.y(i,j,k)*cos(omega*n*dt-3*tau)*exp(-(pow(n*dt-3*tau,2))/pow((tau),2));
            E.z(i,j,k) = E.z(i,j,k) - J.C*J.z(i,j,k)*cos(omega*n*dt-3*tau)*exp(-(pow(n*dt-3*tau,2))/pow((tau),2));
          }

      for (int i=0;i<GridLength-2;i++)
          for (int j=0;j<GridLength-2;j++)
              for (int k=0;k<GridLength-2;k++)
                  H.x(i,j,k)=H.x(i,j,k)+H.C*(E.y(i,j,k+1)-E.y(i,j,k))-H.C*(E.z(i,j+1,k)-E.z(i,j,k));

      for (int i=0;i<GridLength-2;i++)
          for (int j=0;j<GridLength-2;j++)
              for (int k=0;k<GridLength-2;k++)
                  H.y(i,j,k)=H.y(i,j,k)+H.C*(E.z(i+1,j,k)-E.z(i,j,k))-H.C*(E.x(i,j,k+1)-E.x(i,j,k));

      for (int i=0;i<GridLength-2;i++)
          for (int j=0;j<GridLength-2;j++)
              for (int k=0;k<GridLength-2;k++)
                  H.z(i,j,k)=H.z(i,j,k)+H.C*(E.x(i,j+1,k)-E.x(i,j,k))-H.C*(E.y(i+1,j,k)-E.y(i,j,k));

      // Python.call_function_np("plotgaussian", gaussian.data, vector<int>{gaussian.size_0,gaussian.size_1,gaussian.size_2}, PyArray_FLOAT64);
      // Python.call_function_np("plot", E.z.data, vector<int>{E.z.size_0,E.z.size_1,H.z.size_2}, PyArray_FLOAT64);
      if(n>10){
        Python.call_function_np("plot", H.x.data, vector<int>{H.x.size_0,H.x.size_1,H.x.size_2}, PyArray_FLOAT64);
        Python.call("show");
      }

  }

}



