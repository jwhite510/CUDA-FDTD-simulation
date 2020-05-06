#include<iostream>
#include<vector>
#include"pythonarrays.h"
#include"c_arrays.h"

// void E_from_H()



struct E_s{
  array3d<float> E_x;
  array3d<float> E_y;
  array3d<float> E_z;
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
  array3d<float> H_x;
  array3d<float> H_y;
  array3d<float> H_z;
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
  float dt;
  float eps0;
  float mu0;
  float dy;
  float dx;
  float dz;
};
struct J_s{
  array3d<float> J_x;
  array3d<float> J_y;
  array3d<float> J_z;
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

        E.E_x(i,j,k) = E.E_x(i,j,k) +
          (P.dt/P.eps0)*(
            (H.H_z(i,j+1,k) - H.H_z(i,j,k))/P.dy
          - (H.H_y(i,j,k+1) - H.H_y(i,j,k))/P.dz
          - J.J_x(i,j,k)
          );

        E.E_y(i-1,j+1,k) = E.E_y(i-1,j+1,k) +
          (P.dt/P.eps0)*(
            (H.H_x(i-1,j+1,k+1) - H.H_x(i-1,j+1,k))/P.dz
          - (H.H_z(i,j+1,k) - H.H_z(i-1,j+1,k))/P.dx
          -J.J_y(i-1,j+1,k)
          );

        E.E_z(i-1,j,k+1) = E.E_z(i-1,j,k+1) +
          (P.dt*P.eps0)*(
            (H.H_y(i,j,k+1) - H.H_y(i-1,j,k+1))/P.dx
          - (H.H_x(i-1,j+1,k+1) - H.H_x(i-1,j,k+1))/P.dy
          -J.J_z(i-1,j,k+1)
          );
      }
    }
  }
}
void H_from_E(H_s &H, E_s &E, Params &P){

  for(int i=1; i < E.N_x-1; i++){
    for(int j=1; j < E.N_y-1; j++){
      for(int k=1; k < E.N_z-1; k++){

        H.H_x(i-1,j+1,k+1) = H.H_x(i-1,j+1,k+1) +
          (P.dt/P.mu0)*(
            ((E.E_y(i-1,j+1,k+1) - E.E_y(i-1,j+1,k))/P.dz)
          - ((E.E_z(i-1,j+1,k+1) - E.E_z(i-1,j,k+1))/P.dy)
          );

        H.H_y(i,j,k+1) = H.H_y(i,j,k+1) +
          (P.dt/P.mu0)*(
            ((E.E_z(i,j,k+1) - E.E_z(i-1,j,k+1))/P.dx)
          - ((E.E_x(i,j,k+1) - E.E_x(i,j,k))/P.dz)
          );

        H.H_z(i,j+1,k) = H.H_z(i,j+1,k) +
          (P.dt/P.mu0)*(
            ((E.E_x(i,j+1,k) - E.E_x(i,j,k))/P.dy)
          - ((E.E_y(i,j+1,k) - E.E_y(i-1,j+1,k))/P.dx)
          );
      }
    }
  }
}
int main()
{
  std::cout << "hello" << std::endl;
  // make arrays
  int N_x = 201;
  int N_y = 201;
  int N_z = 3;

  E_s E(N_x, N_y, N_z);
  H_s H(N_x, N_y, N_z);
  J_s J(N_x, N_y, N_z);
  float c=2.998e8;
  Params P;
  P.mu0 = 4*M_PI*10e-7;
  cout << "10e-7 => " << 10e-7 << endl;
  P.eps0 = 8.85e-12;
  P.dx = 50e-9;
  P.dy = 50e-9;
  P.dz = 50e-9;
  P.dt = (50e-9)/2*c;

  E_from_H(E, H, J, P);
  H_from_E(H, E, P);
}



