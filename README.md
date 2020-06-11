# CUDA-FDTD-simulation

Finite Difference Time Domain Simulation written in CUDA, with python Bindings. 
All of the CUDA Tensors for the Electric and Magnetic fields are exposed as numpy arrays
in python.

CUDA is used to calculate each point of the computational grid in parrallel on a GPU.

```
import matplotlib.pyplot as plt
import numpy as np
from Cfdtd import FDTD

if __name__=="__main__":
    N_x=200
    N_y=200
    N_z=200
    dx=50e-9
    c=2.998e8
    dt=dx/(2*c)
    freq=500e12;
    omega =2*np.pi*freq;
    tau=10*dt

    fdtd = FDTD(N_x,N_y,N_z,dx,dt,omega,tau)

    time_span=15e-15;
    tmax_steps=int(time_span/dt);

    # define source term
    _x=np.arange(N_x).reshape(-1,1,1)
    _y=np.arange(N_y).reshape(1,-1,1)
    _z=np.arange(N_z).reshape(1,1,-1)
    fdtd.J.z[:,:,:]=np.exp(-(_x-100)**2 / 5)*np.exp(-(_y-100)**2 / 5)*np.exp(-(_z-100)**2 / 5)
    fdtd.J.z[:,:,:]+=np.exp(-(_x-75)**2 / 5)*np.exp(-(_y-75)**2 / 5)*np.exp(-(_z-100)**2 / 5)


    plt.figure(1)
    for n in range(0,tmax_steps):

        fdtd.timestep(5) # run 5 timesteps

        plt.gca().cla()
        # show the x component of the magnetic field
        plt.imshow(fdtd.H.x[:,:,100])
        plt.pause(0.01)


    fdtd.delete()
```
