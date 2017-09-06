clc; close all;clear all;
%% Parâmetros do sinal 
N=1000;                                 % Número de amostras
n=0:N-1;                                % Números de índice de amostra
mu=0;                                   % Média do sinal
var=0.5;                                % Variância
AWGN= mu+var*randn(1,N);                % Geração do ruido

%% Cálculo da Autocorrelação Unilateral
Rxx=zeros(1,2*N);                       % Cria vetor da autocorrelação
% Somatório de cada elemento do vetor

    for Tau= 1 :N+1  
        for n=1: N-Tau+1
            Rxx(Tau)=Rxx(Tau)+AWGN(n)*AWGN(n+Tau-1);
        end;
    end;
Rxx=Rxx/N;

%% Montando lado negativo da autocorrelação manualmente (Simetria Par)
for i= 0:N-1
    Rxx(N+i)= Rxx(N-i+1);
end
Rxx=fftshift(Rxx);   
Rxx(1,N:2*N-1)=Rxx(1,N+1:2*N);

%% Autocorrelação pela função do Matlab
Rxx_Mat=xcorr(AWGN)/N;
Rxx_Mat(1,2*N)=0;

