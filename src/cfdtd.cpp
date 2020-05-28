#include "cfdtd.h"

using namespace std;

Tensor::Tensor(int N_x, int N_y, int N_z):
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
};
FDTD::FDTD(int N_x,int N_y,int N_z,double dx,double dt):
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
void FDTD::timestep(){
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





