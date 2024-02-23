#!/usr/bin/env python
# coding: utf-8

# In[1]:


import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import numpy as np

def func(x,B0, B1, E0, V0):
    #return E0+V0*B0*((V0/x)**(B1-1)/(B1-1)+x/V0-B1/(B1-1))/B1
    return B0*V0*((V0/x)**(B1-1)/B1/(B1-1)+x/B1/V0-1/(B1-1))+E0

def pres(x,B0, B1, E0, V0):
    return 160*B0*((V0/x)**(B1)-1)/B1


# In[2]:


def fit(name):
    data=np.loadtxt('sum-'+name+'.dat',  dtype=np.float,  delimiter=None)
    if name=='C2c':
        data=data/6
    if name=='Ia-3':
        data=data/2
    if name=='p21n':
        data=data/4
    if name=='Pnn2':
        data=data/2
    if name=='R3':
        data=data/3
    if name=='R-3':
        data=data/2
    popt, pcov = curve_fit(func, data[:, 0], data[:, 1], maxfev=50000, p0=(3, 2, -100, 100))
    yvals=func(data[:, 0],popt[0] ,popt[1] , popt[2] , popt[3] )
    cut=pres(data[:, 0],popt[0] ,popt[1] , popt[2] , popt[3] )
    print(popt)
    plt.close()
    plt.plot(data[:, 0], data[ :, 1], '*',label='DFT values')
    plt.plot(data[:, 0], yvals, '',label='Fit values')
    plt.xlabel('$V/cell(A^3)$')
    plt.ylabel('$E(meV)$')
    plt.legend(loc=1) 
    plt.title(name)
    plt.savefig(name+".jpg")
    plt.show()
    plt.close()
    out=np.zeros(shape=(100,3))
    out[:, 2]=np.arange(0,1000,10)
    yvals=func(out[:, 2],popt[0] ,popt[1] , popt[2] , popt[3] )
    cut=pres(out[:, 2],popt[0] ,popt[1] , popt[2] , popt[3] )
    out[:, 0]=cut
    out[:, 1]=yvals
    return out


# In[15]:


fit('Ia-3')


# In[45]:


def fit2(name):
    data=np.loadtxt('sum-'+name+'.dat',  dtype=np.float,  delimiter=None)
    if name=='C2c':
        data=data/6
    if name=='Ia-3':
        data=data/2
    if name=='p21n':
        data=data/4
    if name=='Pnn2':
        data=data/2
    if name=='R3':
        data=(data/3)
    if name=='R-3':
        data=data/2
    popt, pcov = curve_fit(func, data[:, 0], data[:, 1], maxfev=50000, p0=(3, 2, -100, 100))
    yvals=func(data[:, 0],popt[0] ,popt[1] , popt[2] , popt[3] )
    cut=pres(data[:, 0],popt[0] ,popt[1] , popt[2] , popt[3] )
    print(popt)
    out=np.zeros(shape=(100,3))
    out[:, 2]=np.arange(10,1010,10)
    yvals=func(out[:, 2],popt[0] ,popt[1] , popt[2] , popt[3] )
    cut=pres(out[:, 2],popt[0] ,popt[1] , popt[2] , popt[3] )
    out[:, 0]=cut
    out[:, 1]=yvals
    if name=='Ia-3':
        out[:, 1]=yvals+155
    if name=='p21n':
        out[:, 1]=yvals-30
    if name=='R-3':
        out[:, 1]=yvals+22.5
    if name=='R3':
        out[:, 1]=yvals+19.5
    return out


# In[46]:


def my():
    index = ['C2c','Ia-3',  'p21n', 'R3', 'R-3']
    for i1 in range(len(index)):
        data=fit2(index[i1])
        plt.plot(data[:, 0], data[ :, 1], '',label=index[i1])
    plt.axis([0,10 ,-86.5,-83.5])
    plt.ylabel('$E(meV)$')
    plt.xlabel('$P(GPa)$')
    plt.legend(loc=4) 
    plt.savefig("sum.eps")
    plt.show()
    plt.close() 
my()


# In[ ]:




