clc; close all;clear all;
%% Parâmetros do sinal 
N=1000;                                 % Número de amostras
n=0:N-1;                                % Números de índice de amostra
mu=0;                                   % Média do sinal
var=0.5;                                % Variância
AWGN= mu+var*randn(1,N);                % Geração do ruido

%% Cálculo da Autocorrelação
Rxx=zeros(1,N);
    for m=1: N+1
        for n=1: N-m+1
            Rxx(m)=Rxx(m)+AWGN(n)*x(n+m-1);
        end;
    end;
% Montando lado negativo manualmente
Rxx=Rxx/N;
for i= 1:N
    Rxx(N+i)= Rxx(N-i+1);
end
Rxx1=fftshift(Rxx);      
Rxx2=xcorr(x);
Rxx2(1,2*N)=0;