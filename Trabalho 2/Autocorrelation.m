clc; close all;clear all;  
%% Parâmetros do sinal 
N=100;                                  % Número de amostras/Bloco
mu=0;                                   % Média do sinal
var=0.5;                                % Variância
%% Cálculo da Autocorrelação Unilateral
for N=[100 50 10]                       % Número de amostras/Bloco
m=0:N-1;                              % Definição de TAU (Com atraso 0)
for L=[50 500 5000]                     % Número de blocos
AWGN= mu+var*randn(1,N*L);              % Geração do ruido
for l=1:L
Rxx(l,:)=zeros(1,N);                    % Cria vetor da autocorrelação
% Calcula a autocorrelação
    for m= 1 :N+1
        for n=(l-1)*N+1: l*N-m+1
            Rxx(l,m)=Rxx(l,m)+AWGN(n)*AWGN(n+m-1);
        end;
    end;
end
end
n=0:N-1;                                % Números de índice de amostra
figure                                  % Cria uma figura pra N(i)
Rxxfinal=sum(Rxx(:,:)/N);               % Normaliza sinal

%% Plotting
subplot(2,1,1)                          
plot(n,Rxx(l,:))
title(['Autocorrelação para N=',num2str(N(1,1)) ])
subplot(2,1,2)
plot(n,Rxxfinal)
title(['Resultante Para L=[50 500 5000] e N=',num2str(N(1,1)) ])
clear Rxx;
end

