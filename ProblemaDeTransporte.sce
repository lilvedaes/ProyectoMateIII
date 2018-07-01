function rpta = gaussPivPar(A, b)

    [m,n] = size(A)     // Dimesiones de la matriz de entrada
    
    if (m <> n) then    // Comprueba si la matriz es cuadrada
        error("La matriz no es cuadrada.")
    end
    
    // Inicia el algoritmo
    for i = 1:n-1
        // Pivotacion parcial
        [q,p] = max(A(i:n,i))
        p = p+i-1
        A = intercambiarFilas(A, i, p)
        b = intercambiarFilas(b, i, p)
        
        // Triangularizacion
        for j = i+1:n
            r = A(j,i)/A(i,i)
            A(j,:) = A(j,:) - r*A(i,:)
            b(j,:) = b(j,:) - r*b(i,:)
        end
    end
    
    // Sustitucion inversa
    for j = n:-1:1
        suma = 0
        for k = j+1:n
            suma = suma + A(j,k)*x(k)
        end
        x(j) = ( b(j) - suma ) / A(j,j)
    end
    
    //rpta = struct("U", A, "Xsol", x, "Xinf",b)
    //Xsol se usara cuando se tenga una cantidad finita de soluciones, y Xinf cuando sea infinita.

    rpta = struct("U", A, "Xsol", x,"Xinf",b)
endfunction

function rpta = intercambiarFilas(A, i, j)
    temp = A(i,:)
    A(i,:) = A(j,:)
    A(j,:) = temp
    rpta = A
endfunction
