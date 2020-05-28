#include<iostream>
#include<unistd.h>
#include<vector>
#include"c_arrays.h"
#include<fstream>

using namespace std;

// void E_from_H()

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
struct FDTD
{
  Tensor E;
  Tensor H;
  Tensor J;
  // make arrays
  int N_x ;
  int N_y ;
  int N_z ;
  double c;
  double mu0 ;
  double eps0 ;
  double Hc ;
  double Ec ;
  double Jc ;
  FDTD(int N_x,int N_y,int N_z,double dx,double dt):
    // make arrays
    N_x ( N_x),
    N_y ( N_y),
    N_z ( N_z),
    c(2.998e8),
    mu0 ( 4*M_PI*1e-7),
    eps0 ( 8.85e-12),
    Hc ( (1/mu0)*(dt/dx)),
    Ec ( (1/eps0)*(dt/dx)),
    Jc ( (1/eps0)*dt),
    E(N_x, N_y, N_z),
    H(N_x, N_y, N_z),
    J(N_x, N_y, N_z)
  {
  }
  void timestep(){
    for(int i=1; i < E.N_x-2; i++){
      for(int j=1; j < E.N_y-2; j++){
        for(int k=1; k < E.N_z-2; k++){

          E.x(i,j,k)=E.x(i,j,k)+Ec*(H.z(i,j,k)-H.z(i,j-1,k))-Ec*(H.y(i,j,k)-H.y(i,j,k-1));
          E.y(i,j,k)=E.y(i,j,k)+Ec*(H.x(i,j,k)-H.x(i,j,k-1))-Ec*(H.z(i,j,k)-H.z(i-1,j,k));
          E.z(i,j,k)=E.z(i,j,k)+Ec*(H.y(i,j,k)-H.y(i-1,j,k))-Ec*(H.x(i,j,k)-H.x(i,j-1,k));

          E.x(i,j,k) = E.x(i,j,k) - Jc*J.x(i,j,k);
          E.y(i,j,k) = E.y(i,j,k) - Jc*J.y(i,j,k);
          E.z(i,j,k) = E.z(i,j,k) - Jc*J.z(i,j,k);

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
  }
};
int main()
{
  int N_x=50;
  int N_y=50;
  int N_z=50;
  double dx=50e-9;
  double c=2.998e8;
  double dt=((dx)/(2*c));

  // for source term
  double freq=500e12;
  double omega =2*M_PI*freq;

  double time_span=15e-15;
  int tmax_steps=time_span/dt;

  FDTD fdtd(N_x,N_y,N_z,dx,dt);
  for(int n=0; n < tmax_steps; n++){

    // define source term
    for(int i=0; i < fdtd.N_x; i++)
      for(int j=0; j < fdtd.N_y; j++)
        for(int k=0; k < fdtd.N_z; k++)
          fdtd.J.z(i,j,k)=exp(-(pow(i-25,2)/2))*exp(-(pow(j-25,2)/2))*exp(-(pow(k-25,2)/2))*cos(omega*n*dt);

    fdtd.timestep();

    array2d<double>hx_display(fdtd.H.x.size_0,fdtd.H.x.size_1);
    int k=25;
    for(int i=0; i < fdtd.H.x.size_0; i++)
      for(int j=0; j < fdtd.H.x.size_1; j++)
        hx_display(i,j)=fdtd.H.x(i,j,k);

    if(n==0)
      hx_display.show("hx_display");
    else {
      hx_display.write("hx_display");
      usleep(0.5e6);
    }

  }




}



