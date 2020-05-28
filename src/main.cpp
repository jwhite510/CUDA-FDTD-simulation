#include"cfdtd.h"

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
