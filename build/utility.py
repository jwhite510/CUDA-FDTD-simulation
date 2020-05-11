import numpy as np
import matplotlib.pyplot as plt


def plot(a):
    plt.figure(1)
    plt.cla()
    plt.clf()
    plt.imshow(a[:,:,50])
    plt.colorbar()

def show(a):
    plt.ion()
    plt.pause(0.1)
