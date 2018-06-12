import math

def T(x,y):
    rpta = -0.001296*(x-19.37)
    return rpta

x = [0,1,2,3,4,5]
yi = 75.5
h = 1

for i in x:
    k1 = h*T(i,yi)
    k2 = h*T(i + h/2,yi+k1/2)
    k3 = h*T(i + h/2,yi+k2/2)
    k4 = h*T(i + h,yi+k3)

    print("Iteracion: ", i)
    print("yi: ", yi)

    yi = yi + (1/6)*(k1+(2*k2)+(2*k3)+k4)

    print("k1: ", k1)
    print("k2: ", k2)
    print("k3: ", k3)
    print("k4: ", k4)
    print("yi1: ", yi)
