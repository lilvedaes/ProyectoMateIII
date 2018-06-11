clc;
clear;
deff('y=f(x)','y=56.13*exp(-0.001296*x)-0.01')

xa=input('Intervalo inferior: ');
xb=input('Intervalo superior: ');
err=input('Porcentaje de error: ');
erro=100;
xr=0;
i=0;

if f(xa)*f(xb)<0 then
    x=linspace(xa,xb,100)
    y=f(x)
    while erro>err
        i=i+1;
        ea=xr;
        xr=(xa+xb)/2;
        if f(xa)*f(xr)>0 then
            xa=xr;
        else
            xb=xr;
        end
    erro=abs(((ea-xr)/xr)*100);
end
printf('\n\nResultado de la raiz=%12.6f en %4d iteraciones\n',xr,i);
else
    printf('No existe la raiz en el intervalo');
end
