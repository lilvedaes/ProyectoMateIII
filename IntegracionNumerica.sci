function [num]=alterna(x)
    n=0.35*(sin(2*pi*60*x))
    num = n^2
endfunction
function[k]= Trapecio(h,x_0,x_n)
    k=0
    for j = x_0:h:x_n
    is=(alterna(j)+alterna(j+h))*(h/2)
    k = k + is
    end
endfunction
printf('Se desea evaluar el valor de la coriente RMS en el intervalo de tiempo en \nel querealiza un ciclo completo. Se sabe que la coriente pico es 0.35 mA y que la frecuencia\n es 60 Hz por lo que comenzamos a plantear la funcion original\n')
x_0= 0
x_n=1/60
n = 30
pi=3.14159265358979323846264338327
printf('Se realiza de manera interna el calculo de la integral aproximada mediante el metodo del trapecio\n')
for i =1:n
    h=(x_0+x_n)/i
    integ = Trapecio(h,x_0,x_n)
printf('N° de intervalos:'),disp(i)
disp(integ);
end

printf('Como se puede observar la precisión va aumentando conforme va aumentando el \n número de intervalos lo que se está integrando es la funcion original elevada \n al cuadrado. Con 128 intervalos se procede a dividirlo entre el período  \n y extraer su raíz cuadrada')

prom=(integ*60)
prom=prom^0.5
disp(prom)
printf('\nCon esto se obtiene el valor de la corriente RMS para un ciclo completo de dicha\n corriente alterna')

