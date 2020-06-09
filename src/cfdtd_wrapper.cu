// #include"cfdtd.h"
#include"cuda_fdtd.h"
#include<iostream>


using namespace std;
extern "C"{
  void* FDTD_new(int N_x,int N_y,int N_z,
      double dx,double dt,
      double*Ex,double*Ey,double*Ez,
      double*Hx,double*Hy,double*Hz,
      double*Jx,double*Jy,double*Jz
      )
  {

    // FDTD*m = new FDTD(s_0,s_1,s_2,arr1hostd,arr2hostd);
    FDTD*m = new FDTD(N_x,N_y,N_z,
        dx,dt,
        Ex,Ey,Ez,
        Hx,Hy,Hz,
        Jx,Jy,Jz
        );
    return (void*)m;
  }
  void FDTD_run(void*p){
    FDTD*m=(FDTD*)p;
    m->run();
  }


}
