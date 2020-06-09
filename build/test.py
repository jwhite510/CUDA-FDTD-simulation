import matplotlib.pyplot as plt
import time
import numpy as np
from Cfdtd import FDTD

if __name__=="__main__":
    N_x=3
    N_y=3
    N_z=3
    dx=50e-9
    c=2.998e8
    dt=dx/(2*c)
    fdtd = FDTD(N_x,N_y,N_z,dx,dt)


    val=0
    for i in range(3):
        for j in range(3):
            for k in range(3):
                fdtd.E.x[i,j,k]=val
                val+=1


    print("ftdt.E.x")
    print(fdtd.E.x)
    print("ftdt.E.y")
    print(fdtd.E.y)
    # fdtd.a
    fdtd.lib.FDTD_run(fdtd.a)

    print("-----")
    print("ftdt.E.x")
    print(fdtd.E.x)
    print("ftdt.E.y")
    print(fdtd.E.y)



    exit()

    freq=500e12;
    omega =2*np.pi*freq;

    time_span=15e-15;
    tmax_steps=int(time_span/dt);

    _x=np.arange(N_x).reshape(-1,1,1)
    _y=np.arange(N_y).reshape(1,-1,1)
    _z=np.arange(N_z).reshape(1,1,-1)
    plt.figure(1)
    for n in range(0,tmax_steps):

        fdtd.J.z[:,:,:]=np.exp(-(_x-25)**2 / 2)*np.exp(-(_y-25)**2 / 2)*np.exp(-(_z-25)**2 / 2)*np.cos(omega*n*dt)
        fdtd.timestep()

        plt.gca().cla()
        plt.imshow(fdtd.H.x[:,:,25])
        plt.pause(0.1)

