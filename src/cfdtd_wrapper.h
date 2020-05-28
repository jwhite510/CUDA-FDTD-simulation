

#ifdef __cplusplus
extern "C"{
#endif

void* FDTD_new(int N_x,int N_y,int N_z,double dx,double dt);

void FDTD_PrintInt(void*p);
void FDTD_timestep(void*p);

#ifdef __cplusplus
}
#endif
