function [y]=f(t)
    y = 4*sin(t) - 3*t
endfunction

function [y]=fp(t)
    y = 4*cos(t) - 3
endfunction

function [raiz, x, iter, ea]=newtonraphson(x0,f,fp,tol,imax)
    iter = 0; // inicializa numero de iteracoes
    xr = x0; // inicializa raiz aproximada com a inicial
    x(iter+1)=x0; // insere raiz inicial no vetor de raizes
    while (1)
        xrold = xr; 
        xr = xrold - f(xrold)/fp(xrold); // aplica formula de Newton
        iter = iter+1; // incrementa numero de iteracoes
        x(iter+1) = xr; // insere raiz aproximada no respectivo vetor
        if(xr ~= 0) then // calcula erro relativo
            ea(iter)=abs((xr-xrold)/xr);
        end;
        if(ea(iter) <= tol) then // se erro relativo menor que tol, FIM
            raiz = xr;
            return;
        end;
        if(iter >= imax) then // se excedeu num. maximo de iteracoes, FIM
            error('Número Máximo de Iterações Alcançado');
        end;
    end
end

function [h]=altura(t)
    r = 4/t;
    x = r*cos(t);
    h = r - x;
endfunction

x0 = 4;
tol = 0.0001;
imax = 100;

mprintf("i   Gráfico plotado\n");
interv = [-2*%pi:%pi/8:2*%pi];
plot(interv,f);
xgrid;

[raiz, x, iter, ea] = newtonraphson(x0,f,fp,tol,imax);
mprintf("ii  Raiz utilizando método de Newton: %f\n",raiz);

h = altura(raiz);
mprintf("iii Altura máxima da peça: %f\n",h);
