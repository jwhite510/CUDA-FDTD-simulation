

#ifdef __cplusplus
extern "C"{
#endif

void* FDTD_new(int N_x,int N_y,int N_z,
      double dx,double dt,
      double*Ex,double*Ey,double*Ez,
      double*Hx,double*Hy,double*Hz,
      double*Jx,double*Jy,double*Jz
      );

void FDTD_PrintInt(void*p);
void FDTD_timestep(void*p);

#ifdef __cplusplus
}
#endif
