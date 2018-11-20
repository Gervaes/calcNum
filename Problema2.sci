function [y]=f(x)
    y = x^2 - x - 2;
endfunction

function [y]=a(x)
    y = x^2 - 2;
endfunction

function [y]=b(x)
    y = sqrt(2+x);
endfunction

function [y]=c(x)
    y = 1 + 2/x;
endfunction

function [x]=MetodoIterativoLinear(x0,f,tol,imax)
    i = 0;
    x = f(x0);
    E = abs(x-x0);
    x0 = x;
    i = i+1;
    while(E > tol && i < imax)
        x = f(x0);
        E = abs(x-x0);
        x0 = x;
        i = i+1;
    end
endfunction

x = MetodoIterativoLinear(3,a,10^-5,100);
mprintf("%f",x);
