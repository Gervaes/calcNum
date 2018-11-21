//a) Construir uma função no Scilab para implementar o método da Posição Falsa
function [raiz, x, iter, ea]=PosicaoFalsa(xl,xu,f,tol,imax)
    if(f(xl)*f(xu)>0) then
    error('Nenhuma raiz no intervalo f(xl)*f(xu) > 0');
    abort;
end;
iter = 0;
xr = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu));
x(iter+1) = xr;
if(f(xl) * f(xu) < 0) then
    xu = xr;
elseif (f(xl) * f(xr) > 0) then
    xl = xr;
else
    raiz = xr; 
    ea(iter+1) = 0;
    return;
end;
xrold = xr;
    while(%t)
        xr = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu));
        iter = iter + 1;
        x(iter + 1) = xr;
        ea(iter + 1) = abs((xr - xrold)/xr);
        if((f(xl)*f(xr)) < 0) then
            xu = xr;
        elseif ((f(xl) * f(xr)) > 0) then
            xl = xr;
        else
            ea(iter + 1) = 0;
            x(iter+1) = xr;
            raiz = xr;
            return;
        end;
        xrold = xr;
    if (ea(iter + 1) <= tol) then
        raiz = xr;
        return;
    end;
    if(iter >= imax) then
        error('Número Máximo de Iterações Alcançado');        
    end;
end;
endfunction    

//b) Construir uma função no Scilab para implementar o método das Secantes
function [raiz, x, iter, ea]=Secantes(xi, xf, f, tol, imax)
    x1 = xi;
    x2 = xf;
    iter = 0;
    while(%t)
            xrold = x2;
            xr = x2-f(x2)*(x1-x2)/(f(x1)-f(x2));
            iter = iter + 1;
            ea(iter+1) = abs((xr - xrold)/xr);
            x1 = x2;
            x2 = xr;
            x(iter + 1) = xr;     
    if (ea(iter + 1) <= tol) then
        raiz = xr;
        return;
    end;
    if(iter >= imax) then
        error('Número Máximo de Iterações Alcançado');        
    end;
    end;
endfunction

//c) Calcular aproximação para a raiz da equação no intervalo [3,5] com tol=0.001
intervalo = [3,5];
err = 0.001;

function [y]=f(t)
    y = 75*(%e^(-1.5*t)) + 20*(%e^(-0.075*t)) - 15;
endfunction

opcao = input("Digite o método que deseja utilizar:\n   1 - Posição Falsa\n   2 - Secantes\n");

if opcao == 1 then
    [raiz,x,iter,ea] = PosicaoFalsa(intervalo(1),intervalo(2),f,err,100);
else 
    [raiz,x,iter,ea] = Secantes(intervalo(1),intervalo(2),f,err,100);
end

mprintf("i    xi          ei\n");
for i=1:1:size(x,1)
    mprintf("%d    %f    %f\n",i,x(i),ea(i));
end
