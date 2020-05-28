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
  double dx ;
  double dt ;
  double freq;
  double omega ;
  double t;
  double Hc ;
  double Ec ;
  double time_span;
  double Jc ;
  int tmax_steps;
  FDTD():
    // make arrays
    N_x ( 50),
    N_y ( 50),
    N_z ( 50),
    c(2.998e8),
    mu0 ( 4*M_PI*1e-7),
    eps0 ( 8.85e-12),
    dx ( 50e-9),
    dt ( (50e-9)/(2*c)),
    freq(500e12),
    t(0),
    Hc ( (1/mu0)*(dt/dx)),
    Ec ( (1/eps0)*(dt/dx)),
    time_span(15e-15),
    Jc ( (1/eps0)*dt),
    omega ( 2*M_PI*freq),
    tmax_steps(time_span/dt),
    E(50, 50, 50),
    H(50, 50, 50),
    J(50, 50, 50)
  {
  }
  void timestep(int n){
    for(int i=1; i < E.N_x-2; i++){
      for(int j=1; j < E.N_y-2; j++){
        for(int k=1; k < E.N_z-2; k++){

          E.x(i,j,k)=E.x(i,j,k)+Ec*(H.z(i,j,k)-H.z(i,j-1,k))-Ec*(H.y(i,j,k)-H.y(i,j,k-1));
          E.y(i,j,k)=E.y(i,j,k)+Ec*(H.x(i,j,k)-H.x(i,j,k-1))-Ec*(H.z(i,j,k)-H.z(i-1,j,k));
          E.z(i,j,k)=E.z(i,j,k)+Ec*(H.y(i,j,k)-H.y(i-1,j,k))-Ec*(H.x(i,j,k)-H.x(i,j-1,k));

          E.x(i,j,k) = E.x(i,j,k) - Jc*J.x(i,j,k)*cos(omega*n*dt);
          E.y(i,j,k) = E.y(i,j,k) - Jc*J.y(i,j,k)*cos(omega*n*dt);
          E.z(i,j,k) = E.z(i,j,k) - Jc*J.z(i,j,k)*cos(omega*n*dt);
          // E.x(i,j,k) = E.x(i,j,k) - Jc*J.x(i,j,k);
          // E.y(i,j,k) = E.y(i,j,k) - Jc*J.y(i,j,k);
          // E.z(i,j,k) = E.z(i,j,k) - Jc*J.z(i,j,k);

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

  FDTD fdtd;
  for(int n=0; n < fdtd.tmax_steps; n++){
    for(int i=0; i < fdtd.N_x; i++)
      for(int j=0; j < fdtd.N_y; j++)
        for(int k=0; k < fdtd.N_z; k++)
          fdtd.J.z(i,j,k)=exp(-(pow(i-25,2)/2))*exp(-(pow(j-25,2)/2))*exp(-(pow(k-25,2)/2));

    // plot H.x
    // H.x
    fdtd.timestep(n);

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



