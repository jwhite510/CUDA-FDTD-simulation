import numpy as np
import matplotlib.pyplot as plt


def plot(a):
    print("np.shape(a) => ",np.shape(a))
    plt.figure(1)
    plt.cla()
    plt.imshow(a[:,:,2])
    plt.ion()
    plt.pause(0.5)
    # print(a)

def show(a):
    plt.ion()
    plt.pause(0.1)
