function [x] = triangularizacion(A)
    [m,n]=size(A);
    x=A;
    for k= 1: n-1
        for i= k+1:n
            mik=x(i,k)/x(k,k);
            for j= k+1:n
                x(i,j)=x(i,j)-mik*x(k,j);
            end
            x(i,k)=0;
        end
    end
endfunction
