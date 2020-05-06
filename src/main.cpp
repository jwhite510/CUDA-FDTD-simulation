#include<iostream>
#include<vector>
#include"pythonarrays.h"
#include"c_arrays.h"

// void E_from_H()



struct E_s{
  array3d<float> E_x;
  array3d<float> E_y;
  array3d<float> E_z;
  E_s(int N_x, int N_y, int N_z):
    E_x(N_x,N_y+1,N_z+1),
    E_y(N_x+1,N_y,N_z+1),
    E_z(N_x+1,N_y+1,N_z)
  { }
};
struct H_s{
  array3d<float> H_x;
  array3d<float> H_y;
  array3d<float> H_z;
  H_s(int N_x, int N_y, int N_z):
    H_x(N_x+1,N_y,N_z),
    H_y(N_x,N_y+1,N_z),
    H_z(N_x,N_y,N_z+1)
  { }
};

void E_from_H(E_s &E, H_s &H){

  for(int i=0; i < E.E_x.size_0; i++){
    for(int j=0; j < E.E_x.size_1; j++){
      for(int k=0; k < E.E_x.size_2; k++){

        E.E_x(i,j,k) = E.E_x(i,j,k);

        H.H_z(i,j+1,k);
        H.H_z(i,j,k);

        H.H_y(i,j,k+1);
        H.H_y(i,j,k);

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
}



