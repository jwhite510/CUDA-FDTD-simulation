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
    print("dt =>", dt)

    mu0= 4*np.pi*1e-7
    eps0= 8.85e-12
    Hc= (1/mu0)*(dt/dx)
    Ec= (1/eps0)*(dt/dx)
    Jc= (1/eps0)*dt

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

        fdtd.J.z[:,:,:]=np.exp(-(_x-25)**2 / 2)*np.exp(-(_y-25)**2 / 2)*np.exp(-(_z-25)**2 / 2)*np.cos(omega*n*dt)


        fdtd.E.x[1:-1,1:-1,1:-1]=fdtd.E.x[1:-1,1:-1,1:-1]+Ec*(fdtd.H.z[1:-1,1:-1,1:-1]-fdtd.H.z[1:-1,0:-2,1:-1])-Ec*(fdtd.H.y[1:-1,1:-1,1:-1]-fdtd.H.y[1:-1,1:-1,0:-2])
        fdtd.E.y[1:-1,1:-1,1:-1]=fdtd.E.y[1:-1,1:-1,1:-1]+Ec*(fdtd.H.x[1:-1,1:-1,1:-1]-fdtd.H.x[1:-1,1:-1,0:-2])-Ec*(fdtd.H.z[1:-1,1:-1,1:-1]-fdtd.H.z[0:-2,1:-1,1:-1])
        fdtd.E.z[1:-1,1:-1,1:-1]=fdtd.E.z[1:-1,1:-1,1:-1]+Ec*(fdtd.H.y[1:-1,1:-1,1:-1]-fdtd.H.y[0:-2,1:-1,1:-1])-Ec*(fdtd.H.x[1:-1,1:-1,1:-1]-fdtd.H.x[1:-1,0:-2,1:-1])

        fdtd.E.x[1:-1,1:-1,1:-1]-=Jc*fdtd.J.x[1:-1,1:-1,1:-1]
        fdtd.E.y[1:-1,1:-1,1:-1]-=Jc*fdtd.J.y[1:-1,1:-1,1:-1]
        fdtd.E.z[1:-1,1:-1,1:-1]-=Jc*fdtd.J.z[1:-1,1:-1,1:-1]

        fdtd.H.x[1:-1,1:-1,1:-1]=fdtd.H.x[1:-1,1:-1,1:-1]+Hc*(fdtd.E.y[1:-1,1:-1,2:]-fdtd.E.y[1:-1,1:-1,1:-1])-Hc*(fdtd.E.z[1:-1,2:,1:-1]-fdtd.E.z[1:-1,1:-1,1:-1])
        fdtd.H.y[1:-1,1:-1,1:-1]=fdtd.H.y[1:-1,1:-1,1:-1]+Hc*(fdtd.E.z[2:,1:-1,1:-1]-fdtd.E.z[1:-1,1:-1,1:-1])-Hc*(fdtd.E.x[1:-1,1:-1,2:]-fdtd.E.x[1:-1,1:-1,1:-1])
        fdtd.H.z[1:-1,1:-1,1:-1]=fdtd.H.z[1:-1,1:-1,1:-1]+Hc*(fdtd.E.x[1:-1,2:,1:-1]-fdtd.E.x[1:-1,1:-1,1:-1])-Hc*(fdtd.E.y[2:,1:-1,1:-1]-fdtd.E.y[1:-1,1:-1,1:-1])

        # fdtd.timestep()

        plt.gca().cla()
        plt.imshow(fdtd.H.x[:,:,25])
        plt.pause(0.1)

