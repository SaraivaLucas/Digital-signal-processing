clc;clear all;close all;
%% Parâmetros dado pelo professor:
n=0:0.4:10;                                        % Montagem do eixo n
x=(0.9*exp(1j*pi/3)).^n;                            % Montagem do sinal
M=500;                                              % Número de amostras
k=-M:M-1;                                           % Montagem do eixo k
w=pi*k/M;                                           % Ômega em função de k

%% Função
X=dtft(x,n,w)                                       % Chama função DTFT()