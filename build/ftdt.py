import numpy as np
import matplotlib.pyplot as plt


def E_from_H(E,H,J,P):
    E["E_x"][:,:,:]=1.0

    for i in range(1,E["N_x"]-1):
        for j in range(1,E["N_y"]-1):
            for k in range(1,E["N_z"]-1):
                E["E_x"][ i,j,k ] = E["E_x"][ i,j,k ] +\
                  (P["dt"]/(P["eps0"]*P["dx"]))*(
                    (H["H_z"][ i,j+1,k ] - H["H_z"][i,j,k])/P["dy"]
                  - (H["H_y"][i,j,k+1] - H["H_y"][i,j,k])/P["dz"]
                  - P["Jc"]*J["J_x"][i,j,k]
                  );

                E["E_y"][ i-1,j+1,k ] = E["E_y"][i-1,j+1,k] +\
                  (P["dt"]/(P["eps0"]*P["dx"]))*(
                    (H["H_x"][i-1,j+1,k+1] - H["H_x"][i-1,j+1,k])/P["dz"]
                  - (H["H_z"][i,j+1,k] - H["H_z"][i-1,j+1,k])/P["dx"]
                  -P["Jc"]*J["J_y"][i-1,j+1,k]
                  );

                E["E_z"][ i-1,j,k+1 ] = E["E_z"][i-1,j,k+1] +\
                  (P["dt"]/(P["eps0"]*P["dx"]))*(
                    (H["H_y"][i,j,k+1] - H["H_y"][i-1,j,k+1])/P["dx"]
                  - (H["H_x"][i-1,j+1,k+1] - H["H_x"][i-1,j,k+1])/P["dy"]
                  -P["Jc"]*J["J_z"][i-1,j,k+1]
                  );

def H_from_E(H,E,P):
    for i in range(1,E["N_x"]-1):
        for j in range(1,E["N_y"]-1):
            for k in range(1,E["N_z"]-1):

                H["H_x"][i-1,j+1,k+1] = H["H_x"][i-1,j+1,k+1] +\
                  (P["dt"]/(P["mu0"]*P["dx"]))*(
                    ((E["E_y"][i-1,j+1,k+1] - E["E_y"][i-1,j+1,k])/P["dz"])
                  - ((E["E_z"][i-1,j+1,k+1] - E["E_z"][i-1,j,k+1])/P["dy"])
                  );

                H["H_y"][i,j,k+1] = H["H_y"][i,j,k+1] +\
                  (P["dt"]/(P["mu0"]*P["dx"]))*(
                    ((E["E_z"][i,j,k+1] - E["E_z"][i-1,j,k+1])/P["dx"])
                  - ((E["E_x"][i,j,k+1] - E["E_x"][i,j,k])/P["dz"])
                  );

                H["H_z"][i,j+1,k] = H["H_z"][i,j+1,k] +\
                  (P["dt"]/(P["mu0"]*P["dx"]))*(
                    ((E["E_x"][i,j+1,k] - E["E_x"][i,j,k])/P["dy"])
                  - ((E["E_y"][i,j+1,k] - E["E_y"][i-1,j+1,k])/P["dx"])
                  );




if __name__ == "__main__":
    N_x=100
    N_y=100
    N_z=100
    E = {}
    E["E_x"]=np.zeros((N_x,N_y,N_z))
    E["E_y"]=np.zeros((N_x,N_y,N_z))
    E["E_z"]=np.zeros((N_x,N_y,N_z))
    E["N_x"]=N_x
    E["N_y"]=N_y
    E["N_z"]=N_z


    H={}
    H["H_x"]=np.zeros((N_x,N_y,N_z))
    H["H_y"]=np.zeros((N_x,N_y,N_z))
    H["H_z"]=np.zeros((N_x,N_y,N_z))
    H["N_x"]=N_x
    H["N_y"]=N_y
    H["N_z"]=N_z

    J = {}
    J["J_x"]=np.zeros((N_x,N_y,N_z))
    J["J_y"]=np.zeros((N_x,N_y,N_z))
    J["J_z"]=np.zeros((N_x,N_y,N_z))
    J["N_x"]=N_x
    J["N_y"]=N_y
    J["N_z"]=N_z

    c=2.998e8;
    P={}
    P["mu0"] = 4*np.pi*10e-7;
    P["eps0"] = 1/((c**2)*P["mu0"]);
    P["dx"] = 50e-9;
    P["dy"] = 50e-9;
    P["dz"] = 50e-9;
    P["dt"] = (50e-9)/2*c;
    P["Jc"] = (1/(P["eps0"]))*P["dt"]
    # P["dt"] *= 0.01

    # make gaussiain
    _x = np.linspace(-1,1,N_x).reshape(-1,1)
    _y = np.linspace(-1,1,N_y).reshape(1,-1)
    w=0.01
    gaussian=np.exp((-_x**2)/w)*np.exp((-_y**2)/w)
    # plt.figure()
    # plt.pcolormesh(gaussian)
    # plt.show()

    t=0.0
    a=None
    for _ in range(300):
        t+=P["dt"]
        print("np.cos(t) =>", np.cos(t))

        J["J_x"][:,:,:]=np.cos(t)*np.expand_dims(gaussian,2)

        print("np.max(J['J_x'][:,:,1]) =>", np.max(J['J_x'][:,:,1]))

        plt.figure(1)

        # image = j["j_x"][:,:,1]
        image = H["H_z"][:,:,50]
        if(not a):
            im = plt.imshow(image)
            colorbar=plt.colorbar()
            a=10
        else:
            im.set_clim(vmin=np.min(image), vmax=np.max(image))
            im.set_data(image)
            plt.pause(0.5)

        E_from_H(E,H,J,P)
        H_from_E(H,E,P)

