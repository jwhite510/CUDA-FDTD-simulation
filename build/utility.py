import matplotlib.pyplot as plt
import numpy as np

def plot(a):
    print("np.shape(a) => ",np.shape(a))
    plt.figure(1)
    plt.cla()
    plt.imshow(a[:,:,2])
    plt.ion()
    plt.pause(0.5)
    # print(a)

def plotJX(a):
    plt.figure(2)
    plt.cla()
    plt.clf()
    plt.pcolormesh(a[:,:,50])
    plt.colorbar()
    print("np.shape(a) => ",np.shape(a))

def show(a):
    plt.ion()
    plt.pause(0.1)

def plotgaussian(a):
    print("np.shape(a) => ",np.shape(a))
    plt.figure(1)
    # plt.ion()
    for i in range(40,60):
        print(i)
        plt.figure(1)
        plt.pcolormesh(a[:,:,i])
        plt.colorbar()
        plt.show()

