import numpy as np
import matplotlib.pyplot as plt



if __name__ == "__main__":

    time_span=15*10**-15;
    dr=50*10**-9;
    c=2.99792458*10**8;
    freq=500*10**12;
    tau=1*10^-15;

    munot=4*np.pi*10**-7;
    epsnot=1/((c**2)*munot);
    dt=dr/(2*c);
    tmax_steps=time_span/dt;
    tmax_steps=round(tmax_steps);
    omega = 2*np.pi*freq;

    eps_rel=np.ones((100,100,100));
    GridLength=100
    ex=np.zeros(np.shape(eps_rel));
    ey=np.zeros(np.shape(eps_rel));
    ez=np.zeros(np.shape(eps_rel));
    hx=np.zeros(np.shape(eps_rel));
    hy=np.zeros(np.shape(eps_rel));
    hz=np.zeros(np.shape(eps_rel));


    jx=np.zeros((100,100,100));
    jy=np.zeros((100,100,100));
    jz=np.zeros((100,100,100));
    for x in range(0,100):
        for y in range(0,100):
            for z in range(0,100):
                jz[x,y,z]=np.exp(-(((x-50)**2)/2)-(((y-50)**2)/2)-(((z-50)**2)/2));



    Ec=(1/(epsnot*eps_rel))*(dt/dr);
    Hc=(1/(munot))*(dt/dr);
    Jc=(1/(epsnot*eps_rel))*(dt);

    for n in range(0,int(tmax_steps)):
        print("runnign iteration "+str(n))
        for i in range(2,GridLength-1):
            for j in range(2,GridLength-1):
                for k in range(2,GridLength-1):
                    ex[i,j,k]=ex[i,j,k]+Ec[i,j,k]*(hz[i,j,k]-hz[i,j-1,k])-Ec[i,j,k]*(hy[i,j,k]-hy[i,j,k-1]);
        for i in range(2,GridLength-1):
            for j in range(2,GridLength-1):
                for k in range(2,GridLength-1):
                    ey[i,j,k]=ey[i,j,k]+Ec[i,j,k]*(hx[i,j,k]-hx[i,j,k-1])-Ec[i,j,k]*(hz[i,j,k]-hz[i-1,j,k]);
        for i in range(2,GridLength-1):
            for j in range(2,GridLength-1):
                for k in range(2,GridLength-1):
                    ez[i,j,k]=ez[i,j,k]+Ec[i,j,k]*(hy[i,j,k]-hy[i-1,j,k])-Ec[i,j,k]*(hx[i,j,k]-hx[i,j-1,k]);
        ex = ex - Jc*jx*np.cos(omega*n*dt-3*tau)*np.exp(-((n*dt-3*tau)**2)/(tau)**2);
        ey = ey - Jc*jy*np.cos(omega*n*dt-3*tau)*np.exp(-((n*dt-3*tau)**2)/(tau)**2);
        ez = ez - Jc*jz*np.cos(omega*n*dt-3*tau)*np.exp(-((n*dt-3*tau)**2)/(tau)**2);
        for i in range(1,GridLength-1):
            for j in range(1,GridLength-1):
                for k in range(1,GridLength-1):
                    hx[i,j,k]=hx[i,j,k]+Hc*(ey[i,j,k+1]-ey[i,j,k])-Hc*(ez[i,j+1,k]-ez[i,j,k]);
        for i in range(1,GridLength-1):
            for j in range(1,GridLength-1):
                for k in range(1,GridLength-1):
                    hy[i,j,k]=hy[i,j,k]+Hc*(ez[i+1,j,k]-ez[i,j,k])-Hc*(ex[i,j,k+1]-ex[i,j,k]);
        for i in range(1,GridLength-1):
            for j in range(1,GridLength-1):
                for k in range(1,GridLength-1):
                    hz[i,j,k]=hz[i,j,k]+Hc*(ex[i,j+1,k]-ex[i,j,k])-Hc*(ey[i+1,j,k]-ey[i,j,k]);
        if n > 10:
            plt.figure()
            plt.imshow(hx[:,:,50])
            plt.colorbar()
            plt.show()
            # %store field

        # if mod(n,output_step)==0
        # F(:,:,:,L)=eval(field_component);
        # if L>=2
        # t(L)=t(L-1)+dt;
        # L=L+1;
    # [~,~,~,s]=size(F);
    # Fnew=np.zeros(GridLength,GridLength,s);
    # for p in range(1,s):
    #     Fnew(:,:,p)=F(:,:,z_index,p);
    # end
    F=Fnew;


