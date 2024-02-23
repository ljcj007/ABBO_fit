import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import numpy as np

def func1(x,B0, B1,E0, V0):
    return E0+(9.0/16)*V0*B0*(((V0/x)**(2.0/3)-1)**(3.0)*B1)+(9.0/16)*V0*B0*((V0/x)**(2.0/3)-1)**(2.0)*(6-4*(V0/x)**(2.0/3))

def pres1(x,B0, B1, E0, V0):
    return (2.0/3)*B0*((V0/x)**(7.0/3)-(V0/x)**(5.0/3))*(1+(3.0/4)*(B1-4)*((V0/x)**(2.0/3)-1))*160
    
def pres3(x,B0, B1, E0, V0):
    return (2.0/3)*B0*((V0/x)**(7.0/3)-(V0/x)**(5.0/3))*160

def func(x,B0, B1, E0, V0):
    #return E0+V0*B0*((V0/x)**(B1-1)/(B1-1)+x/V0-B1/(B1-1))/B1
    return B0*V0*((V0/x)**(B1-1)/B1/(B1-1)+x/B1/V0-1/(B1-1))+E0

def pres(x,B0, B1, E0, V0):
    return 160*B0*((V0/x)**(B1)-1)/B1

def fit(name):
    data=np.loadtxt('sum-'+name+'.dat',  dtype=np.float,  delimiter=None)
    popt, pcov = curve_fit(func, data[:, 0], data[:, 1], maxfev=50000, p0=(3, 2, -2000, 2000))
    yvals=func(data[:, 0],popt[0] ,popt[1] , popt[2] , popt[3] )
    cut=pres(data[:, 0],popt[0] ,popt[1] , popt[2] , popt[3] )
    print(popt)
    plt.plot(data[:, 0], data[ :, 1], '*',label='DFT values')
    plt.plot(data[:, 0], yvals, '',label='Fit values')
    plt.xlabel('$V/cell(A^3)$')
    plt.ylabel('$E(meV)$')
    plt.legend(loc=1) 
    plt.title(name)
    plt.show()
    data[:, 0]=cut
    data[:, 1]=yvals
    return data
    
def mytry2():
    index = ['C2c', 'p21n', 'Pnn2', 'R3', 'R-3']
    for i1 in range(len(index)):
        data=fit(index[i1])
        np.savetxt(index[i1]+'.data', data, fmt="%.2f")
        
def fit2(name, i1):
    data=np.loadtxt('sum-'+name+'.dat',  dtype=np.float,  delimiter=None)
    popt, pcov = curve_fit(func1, data[:, 0], data[:, 1], maxfev=50000, p0=(3, 2, -2000, 2000))
    out=np.zeros(shape=(100,3))
    out[:, 2]=np.arange(1001,2001,10)
    yvals=func1(out[:, 2],popt[0] ,popt[1] , popt[2] , popt[3] )
    print(popt)
    cut=pres1(out[:, 2],popt[0] ,popt[1] , popt[2] , popt[3] )
    out[:, 0]=cut
    out[:, 1]=yvals/12
    return out
    
def my():
    index = ['C2c', 'P21n', 'R3', 'R-3' ]
    for i1 in range(len(index)):
        data=fit2(index[i1], i1)
        plt.plot(data[:, 0], data[ :, 1], '',label=index[i1])
    plt.xlim((0,8))
    plt.ylim((-83,-80))
    plt.ylabel('$E(meV)$')
    plt.xlabel('$P(GPa)$')
    plt.legend(loc=4) 
    plt.savefig("sum.eps")
    plt.show()
#fit( 'Pnn2')
my()
