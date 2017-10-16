clc;clear all;close all;
%% Parâmetros
fs=5*1e4;                                               % Frequência de amsotragem 500kHz
ti=5e-3;                                                % Tempo inicial
t=-ti:1/fs:ti-1/fs;                                     % Eixo do tempo
xv=exp(-1000*abs(t));                                   % Sinal x(n)
subplot(3,2,1)
plot(t,xv)
title('Sinal Não Amostrado no Tempo')

%% Aplicando a transformada de Fourier ao sinal 500kHz - No_return-to-zero
lfft=length(xv);
Xa=fftshift(fft(xv,lfft)/lfft);
freq500=-fs/2:fs/lfft:fs/2-1/fs;
subplot(3,2,2)
plot(freq500,abs(Xa))
title('Sinal Não Amostrado na Frequência')
axis([-2000 2000 0  1.2*max(abs(Xa))])

%% Amostragem 5kHz
FS=5e3;                                                 % Nova frequência de amostragem 5kHz
N=round(fs/FS);                                         % Numeros de elementos pulados
x_samp=downsample(xv,N);                                % Coleta 1 amostra a cada N_samp amostras do sinal 
x_samp=upsample(x_samp,N);                              % Retorna vetor amostrado com o número inicial de elementos
subplot(3,2,3)
plot(t,x_samp)                    
title('Sinal Amostrado no Tempo')

%% Aplicando a transformada de Fourier ao sinal Amostrado 5kHz
lfft=length(x_samp);
Xa5=fftshift(fft(x_samp,lfft)/lfft);
freq5=-FS/2:FS/lfft:FS/2-1/FS;
subplot(3,2,4)
plot(freq5,abs(Xa5))
title('Sinal Amostrado na Frequência')
axis([-2000 2000 0 1.2*max(abs(Xa5))])

%% Amostragem 1kHz
FS=1e3;                                                 % Nova frequência de amostragem 1kHz
N=round(fs/FS);                                         % Numeros de elementos pulados
x_samp=downsample(xv,N);                                % Coleta 1 amostra a cada N_samp amostras do sinal 
x_samp=upsample(x_samp,N);                              % Retorna vetor amostrado com o número inicial de elementos
subplot(3,2,5)
plot(t,x_samp)                    
title('Sinal Amostrado no Tempo')

%% Aplicando a transformada de Fourier ao sinal Amostrado 1kHz
lfft=length(x_samp);
Xa1=fftshift(fft(x_samp,lfft)/lfft);
freq1=-FS/2:FS/lfft:FS/2-1/FS;
subplot(3,2,6)
plot(freq1,abs(Xa1))
title('Sinal Amostrado na Frequência')
axis([-200 200 0 1.2*max(abs(Xa1))])