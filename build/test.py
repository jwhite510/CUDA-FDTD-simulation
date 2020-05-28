import matplotlib.pyplot as plt
import ctypes
import numpy as np

lib=ctypes.cdll.LoadLibrary('libcfdtd_wrapper.so')

N_x=50
N_y=50
N_z=50
dx=50e-9
c=2.998e8
dt=dx/(2*c)

a=lib.FDTD_new(
        ctypes.c_int(N_x),
        ctypes.c_int(N_y),
        ctypes.c_int(N_z),
        ctypes.c_double(dx),
        ctypes.c_double(dt)
        )
lib.FDTD_PrintInt(a)
lib.FDTD_timestep(a)
lib.FDTD_PrintInt(a)

