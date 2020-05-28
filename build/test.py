import matplotlib.pyplot as plt
import ctypes
import numpy as np

class Tensor():
    def __init__(self,N_x,N_y,N_z):
        self.x=np.zeros((N_x,N_y,N_z),dtype=np.double)
        self.y=np.zeros((N_x,N_y,N_z),dtype=np.double)
        self.z=np.zeros((N_x,N_y,N_z),dtype=np.double)

if __name__=="__main__":
    N_x=50
    N_y=50
    N_z=50
    E = Tensor(N_x,N_y,N_z)
    H = Tensor(N_x,N_y,N_z)
    J = Tensor(N_x,N_y,N_z)

    dx=50e-9
    c=2.998e8
    dt=dx/(2*c)

    c_double_p=ctypes.POINTER(ctypes.c_double)
    lib=ctypes.cdll.LoadLibrary('libcfdtd_wrapper.so')
    a=lib.FDTD_new(
            ctypes.c_int(N_x), ctypes.c_int(N_y), ctypes.c_int(N_z),
            ctypes.c_double(dx), ctypes.c_double(dt),
            E.x.ctypes.data_as(c_double_p),E.y.ctypes.data_as(c_double_p),E.z.ctypes.data_as(c_double_p),
            H.x.ctypes.data_as(c_double_p),H.y.ctypes.data_as(c_double_p),H.z.ctypes.data_as(c_double_p),
            J.x.ctypes.data_as(c_double_p),J.y.ctypes.data_as(c_double_p),J.z.ctypes.data_as(c_double_p)
            )
    lib.FDTD_PrintInt(a)
    lib.FDTD_timestep(a)
    lib.FDTD_PrintInt(a)

