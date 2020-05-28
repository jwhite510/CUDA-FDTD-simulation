#include"cfdtd_wrapper.h"
#include"cfdtd.h"


using namespace std;
extern "C"{
  void* FDTD_new(double _dx)
  {
    int N_x=50;
    int N_y=50;
    int N_z=50;
    double dx=50e-9;
    double c=2.998e8;
    double dt=((dx)/(2*c));
    FDTD*fdtd = new FDTD(N_x,N_y,N_z,dx,dt);
    return (void*)fdtd;
  }
  void FDTD_PrintInt(void*p){
    FDTD*fdtd=(FDTD*)p;
    // m->PrintInt();
  }
}
