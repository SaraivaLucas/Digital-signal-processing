clc;clear all;close all;
%% Parâmetros
fs=5*1e3;                                               % Frequência de amsotragem 500kHz
ti=5e-3;                                                % Tempo inicial
t=-ti:1/fs:ti-1/fs;                                     % Eixo do tempo
xv=exp(-1000*abs(t));                                   % Sinal x(n)
subplot(2,2,1)
plot(t,xv)
title('Sinal Não Amostrado no Tempo')

%% Aplicando a transformada de Fourier ao sinal
lfft=length(xv);
Xa=fftshift(fft(xv,lfft)/lfft);
freq=-fs/2:fs/lfft:fs/2-1/fs;
subplot(2,2,2)
plot(freq,abs(Xa))
title('Sinal Não Amostrado na Frequência')

%% Amostragem
FS=1;                                                 % Nova frequência de amostragem 5kHz
N=round(fs/FS);                                         % Numeros de elementos pulados
x_samp=downsample(xv,N);                                % Coleta 1 amostra a cada N_samp amostras do sinal 
x_samp=upsample(xv,N);                                  % Retorna vetor amostrado com o número inicial de elementos
subplot(2,2,3)
plot(x_samp)                    
title('Sinal Amostrado no Tempo')

%% Aplicando a transformada de Fourier ao sinal Amostrado
lfft=length(x_samp);
Xa=fftshift(fft(x_samp,lfft)/lfft);
freq=-fs/2:fs/lfft:fs/2-1/fs;
subplot(2,2,4)
plot(freq,abs(Xa))
title('Sinal Amostrado na Frequência')