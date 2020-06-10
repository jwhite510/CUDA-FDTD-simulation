import matplotlib.pyplot as plt
import time
import numpy as np
from Cfdtd import FDTD

if __name__=="__main__":
    N_x=50
    N_y=50
    N_z=50
    dx=50e-9
    c=2.998e8
    dt=dx/(2*c)
    fdtd = FDTD(N_x,N_y,N_z,dx,dt)

    freq=500e12;
    omega =2*np.pi*freq;

    time_span=15e-15;
    tmax_steps=int(time_span/dt);

    _x=np.arange(N_x).reshape(-1,1,1)
    _y=np.arange(N_y).reshape(1,-1,1)
    _z=np.arange(N_z).reshape(1,1,-1)
    plt.figure(1)
    for n in range(0,tmax_steps):

        # todo: evolve J in cuda, 
        fdtd.J.z[:,:,:]=np.exp(-(_x-25)**2 / 5)*np.exp(-(_y-25)**2 / 5)*np.exp(-(_z-25)**2 / 5)*np.cos(omega*n*dt)*np.exp(-n*dt/(5*dt))
        # fdtd.timestep()

        time1=time.time()
        fdtd.lib.FDTD_run(fdtd.a,1)
        time2=time.time()
        print("duration:"+str(time2-time1))

        plt.gca().cla()
        plt.imshow(fdtd.H.x[:,:,13])
        plt.pause(0.01)

