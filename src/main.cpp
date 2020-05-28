#include<iostream>
#include<unistd.h>
#include<vector>
#include"c_arrays.h"
#include<fstream>

using namespace std;

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
struct Params{
  double dt;
  double eps0;
  double mu0;
  double dy;
  double dx;
  double dz;
};
struct Tensor{
  array3d<double> x;
  array3d<double> y;
  array3d<double> z;
  int N_x;
  int N_y;
  int N_z;
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
  int N_x = 50;
  int N_y = 50;
  int N_z = 50;

  double c=2.998e8;
  double mu0 = 4*M_PI*1e-7;
  double eps0 = 8.85e-12;
  double dx = 50e-9;
  double dt = (50e-9)/(2*c);
  double freq=500e12;
  double omega = 2*M_PI*freq;

  Tensor E(N_x, N_y, N_z);
  Tensor H(N_x, N_y, N_z);
  Tensor J(N_x, N_y, N_z);


  double t=0;
  double Hc = (1/mu0)*(dt/dx);
  double Ec = (1/eps0)*(dt/dx);
  double time_span=15e-15;
  double Jc = (1/eps0)*dt;
  int tmax_steps=time_span/dt;


  for(int i=0; i < N_x; i++)
    for(int j=0; j < N_y; j++)
      for(int k=0; k < N_z; k++)
        J.z(i,j,k)=exp(-(pow(i-25,2)/2))*exp(-(pow(j-25,2)/2))*exp(-(pow(k-25,2)/2));

  for(int n=0; n < tmax_steps; n++){
    for(int i=1; i < E.N_x-2; i++){
      for(int j=1; j < E.N_y-2; j++){
        for(int k=1; k < E.N_z-2; k++){

          E.x(i,j,k)=E.x(i,j,k)+Ec*(H.z(i,j,k)-H.z(i,j-1,k))-Ec*(H.y(i,j,k)-H.y(i,j,k-1));
          E.y(i,j,k)=E.y(i,j,k)+Ec*(H.x(i,j,k)-H.x(i,j,k-1))-Ec*(H.z(i,j,k)-H.z(i-1,j,k));
          E.z(i,j,k)=E.z(i,j,k)+Ec*(H.y(i,j,k)-H.y(i-1,j,k))-Ec*(H.x(i,j,k)-H.x(i,j-1,k));

          E.x(i,j,k) = E.x(i,j,k) - Jc*J.x(i,j,k)*cos(omega*n*dt);
          E.y(i,j,k) = E.y(i,j,k) - Jc*J.y(i,j,k)*cos(omega*n*dt);
          E.z(i,j,k) = E.z(i,j,k) - Jc*J.z(i,j,k)*cos(omega*n*dt);

        }
      }
    }
    for(int i=1; i < E.N_x-2; i++){
      for(int j=1; j < E.N_y-2; j++){
        for(int k=1; k < E.N_z-2; k++){

          H.x(i,j,k)=H.x(i,j,k)+Hc*(E.y(i,j,k+1)-E.y(i,j,k))-Hc*(E.z(i,j+1,k)-E.z(i,j,k));
          H.y(i,j,k)=H.y(i,j,k)+Hc*(E.z(i+1,j,k)-E.z(i,j,k))-Hc*(E.x(i,j,k+1)-E.x(i,j,k));
          H.z(i,j,k)=H.z(i,j,k)+Hc*(E.x(i,j+1,k)-E.x(i,j,k))-Hc*(E.y(i+1,j,k)-E.y(i,j,k));
        }
      }
    }

    // plot H.x
    // H.x
    array2d<double>hx_display(H.x.size_0,H.x.size_1);
    int k=25;
    for(int i=0; i < H.x.size_0; i++)
      for(int j=0; j < H.x.size_1; j++)
        hx_display(i,j)=H.x(i,j,k);

    if(n==0)
      hx_display.show("hx_display");
    else {
      hx_display.write("hx_display");
      usleep(0.5e6);
    }

  }




}



