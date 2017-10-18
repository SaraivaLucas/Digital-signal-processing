clc;clear all;close all;
%% Parâmetros
t_0=5e-3;                                                   % Tempo de "Período"
N_ele=2048;                                                 % Número de elementos do Sinal
T=t_0/N_ele;                                                % Taxa de amostragem (Passo entre as amostras)
fs=1/T;                                                     % Frequência de amostragem
t=-t_0:1/fs:t_0-1/fs;                                       % Eixo do tempo
xv=exp(-1000*abs(t));                                       % Sinal x(n)
% Plotting
fig=figure;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 9 7];
subplot(3,2,1)
plot(t,xv)
title('Sinal Não Amostrado no Tempo')
axis([-t_0 t_0 0 1.2*max(abs(xv))])

%% Aplicando a transformada de Fourier ao sinal 500kHz - No_return-to-zero
freq=-fs/2:fs/N_ele:fs/2-1/fs;                              % Montagem do eixo da frequência
Xa=dtft(xv,t,freq);                                         % Espectro do sinal DTFT
% Plotting
subplot(3,2,2)
plot(freq,abs(Xa))
title('Sinal Não Amostrado na Frequência')
axis([-50000 50000 0 1.2*max(abs(Xa))])

%% Amostragem 1kHz
fs1k=1e3;                                                   % Nova frequência de amostragem 1kHz
N=round(fs/fs1k);                                           % Números de elementos pulados
x_samp1=downsample(xv,N);                                   % Coleta 1 amostra a cada N_samp amostras do sinal 
x_samp1=upsample(x_samp1,N);                                % Retorna vetor amostrado com o número inicial de elementos
x_samp1=x_samp1(1,1:length(t));                             % Corrige comprimento de vetores
% Plotting
subplot(3,2,5)
plot(t,x_samp1(1,1:length(t)))                 
title('Sinal Amostrado no Tempo')
axis([-t_0 t_0 0 1.2*max(abs(x_samp1))])

%% Aplicando a transformada de Fourier ao sinal Amostrado 1kHz
Xa1=dtft(x_samp1,t,freq);                                   % Espectro do sinal DTFT
% Plotting
subplot(3,2,6)
plot(freq,abs(Xa1))
title('Sinal Amostrado na Frequência')
axis([-50000 50000 0 1.2*max(abs(Xa1))])

%% Amostragem 5kHz
fs5k=5e3;                                                   % Nova frequência de amostragem 5kHz
N=round(fs/fs5k);                                           % Numeros de elementos pulados
x_samp5=downsample(xv,N);                                   % Coleta 1 amostra a cada N_samp amostras do sinal 
x_samp5=upsample(x_samp5,N);                                % Retorna vetor amostrado com o número inicial de elementos
x_samp5=x_samp5(1,1:length(t));                             % Corrige comprimento de vetores
% Plotting
subplot(3,2,3)
plot(t,x_samp5(1,1:length(t)))                 
title('Sinal Amostrado no Tempo')
axis([-t_0 t_0 0 1.2*max(abs(x_samp5))])

%% Aplicando a transformada de Fourier ao sinal Amostrado 5kHz
Xa5=dtft(x_samp5,t,freq);                                   % Espectro do sinal DTFT   
% Plotting
subplot(3,2,4)
plot(freq,abs(Xa5))
title('Sinal Amostrado na Frequência')
axis([-50000 50000 0 1.2*max(abs(Xa5))])