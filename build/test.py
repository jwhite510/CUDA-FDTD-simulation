import matplotlib.pyplot as plt
import time
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

    freq=500e12;
    omega =2*np.pi*freq;

    time_span=15e-15;
    tmax_steps=int(time_span/dt);
    plt.figure(1)
    _x=np.arange(N_x).reshape(-1,1,1)
    _y=np.arange(N_y).reshape(1,-1,1)
    _z=np.arange(N_z).reshape(1,1,-1)
    for n in range(0,tmax_steps):

        time1=time.time()
        # for i in range(0,N_x):
            # for j in range(0,N_y):
                # for k in range(0,N_z):
                    # J.z[i,j,k]=np.exp(-(i-25)**2 / 2)*np.exp(-(j-25)**2 / 2)*np.exp(-(k-25)**2 / 2)*np.cos(omega*n*dt)
        J.z[:,:,:]=np.exp(-(_x-25)**2 / 2)*np.exp(-(_y-25)**2 / 2)*np.exp(-(_z-25)**2 / 2)*np.cos(omega*n*dt)
        time2=time.time()
        print("python duration:"+str(time2-time1))

        time1=time.time()
        lib.FDTD_PrintInt(a)
        lib.FDTD_timestep(a)
        time2=time.time()
        print("c++ step duration:"+str(time2-time1))

        plt.gca().cla()
        plt.imshow(H.x[:,:,25])
        plt.pause(0.1)

        # print("time step"+str(i)+" finished")

