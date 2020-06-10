import ctypes
import numpy as np

class Tensor():
    def __init__(self,N_x,N_y,N_z):
        self.x=np.zeros((N_x,N_y,N_z),dtype=np.double)
        self.y=np.zeros((N_x,N_y,N_z),dtype=np.double)
        self.z=np.zeros((N_x,N_y,N_z),dtype=np.double)

class FDTD():
    def __init__(self,N_x,N_y,N_z,dx,dt,omega,tau):

        self.E = Tensor(N_x,N_y,N_z)
        self.H = Tensor(N_x,N_y,N_z)
        self.J = Tensor(N_x,N_y,N_z)
        c_double_p=ctypes.POINTER(ctypes.c_double)
        self.lib=ctypes.cdll.LoadLibrary('libcfdtd_wrapper.so')
        self.a=self.lib.FDTD_new(
                ctypes.c_int(N_x), ctypes.c_int(N_y), ctypes.c_int(N_z),
                ctypes.c_double(dx), ctypes.c_double(dt), ctypes.c_double(omega), ctypes.c_double(tau),
                self.E.x.ctypes.data_as(c_double_p),self.E.y.ctypes.data_as(c_double_p),self.E.z.ctypes.data_as(c_double_p),
                self.H.x.ctypes.data_as(c_double_p),self.H.y.ctypes.data_as(c_double_p),self.H.z.ctypes.data_as(c_double_p),
                self.J.x.ctypes.data_as(c_double_p),self.J.y.ctypes.data_as(c_double_p),self.J.z.ctypes.data_as(c_double_p)
                )

    def timestep(self,N):
        self.lib.FDTD_run(self.a,N)

    def delete(self):
        self.lib.FDTD_delete(self.a)


