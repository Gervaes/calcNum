
/*          Análise

      Sobre as equações:
        Algumas equeações serviram melhor que outras para representar a raiz
      positiva da equação 'f'. No caso da equação 'a', ela divergiu, "explodindo"
      para infinito, o que mostra que ela não é boa alternativa para representar
      a raiz. No caso das equações 'b' e 'c', ambas se aproximaram de 2, valor da
      raiz positiva da equação 'f', mostrando assim que são boas alternativas para
      representar a raíz.
      
      Sobre a aproximação inicial:
        Para aproximação inicial foram usados valores de 1 a 10 e o que foi obser
      vado é que o número de iterações não se altera drasticamente independente do
      número escolhido para aproximação inicial.
      
      Sobre as iterações:
        O número de iterações, como já dito acima, se manteve semelhante com valores
      diferentes de aproximação inicial. No caso da equação a, com x0=3, foram cerca 
      de 11 iterações até atingir Infinito e a função terminar. No caso da equação b 
      foram cerca de 10 iterações até entrar na margem de tolerância de erro de 10^-5.
      No caso da equação c foram cerca de 18 iterações para entrar na margem de 
      tolerância. O número máximo de iterações foi setado para 100 em todas os testes.
*/

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
    y = 1 + (2/x);
endfunction

function [y]=diagonal(x)
    y = x;
endfunction

// Método iterativo linear
function [x,i]=MetodoIterativoLinear(x0,f,tol,imax)
    i = 1;
    x(i) = f(x0);
    E = abs(x-x0);
    x0 = x(i);
    i = i+1;
    while(E > tol && i < imax)
        x(i) = f(x0);
        E = abs(x(i)-x0);
        x0 = x(i);
        i = i+1;
    end
endfunction

x0 = 3;
tol = 10^-5;
imax = 100;
interv = [-3:0.1:3];

[x,i] = MetodoIterativoLinear(x0,a,tol,imax);
mprintf("\nUsando equação a com x0=%d foram %d iterações:\ni       x\n",x0,i);
for i=1:1:size(x,1)
    mprintf("%d       %f\n",i,x(i));
end

[x,i] = MetodoIterativoLinear(x0,b,tol,imax);
mprintf("\nUsando equação b com x0=%d foram %d iterações:\ni       x\n",x0,i);
for i=1:1:size(x,1)
    mprintf("%d       %f\n",i,x(i));
end

[x,i] = MetodoIterativoLinear(x0,c,tol,imax);
mprintf("\nUsando equação c com x0=%d foram %d iterações:\ni       x\n",x0,i);
for i=1:1:size(x,1)
    mprintf("%d       %f\n",i,x(i));
end

subplot(221);
plot(interv,a,interv,diagonal);
xgrid;
subplot(222);
plot(interv,b,interv,diagonal);
xgrid;
subplot(223);
plot(interv,c,interv,diagonal);
xgrid;
