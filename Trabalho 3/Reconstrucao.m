% Reconstrucao_sinc.m
close all;clear all; clc;
%% Parâmetros
% Coletaremos todos os dados do processo de amostragem para que o código
% não fique extenso. Todas as variáveis terão o mesmo nome. O arquivo .mat
% deve sempre está na pasta em que o script está.
load('/Amostragem5k.mat')
f_0=fs/N_ele;                                                    % Passo de frequencia.: f_0=freq(2)-freq(1)
close all
Tf=(t_0-1/fs)
%% Reconstrução via Sincs
 yrec = x_samp5;
        TsNew = T;
        x_recon=0;
        nSamples = length(yrec);
        xSamples = 0 : nSamples-1;
        trec = nSamples/Tf*[0:T:Tf];
        trec2=trec;
        tSinc = 0.005;
        Tfsinc = t_0-1/fs;
        for ik = xSamples
            %lsin=ik:-tSinc:-nSamples+ik;
            tnew = -t_0:T/N_ele:Tfsinc;
            x_recon=x_recon+yrec(ik+1)*sinc(2*pi*fs*(tnew-ik*1/fs));
 
        end
        
            figure(2);
            subplot(2,1,1);
            stem(t, x_samp5,'filled');
            hold on;
            plot(t,xv,'r-o');
            title('Sinal de "Tempo Cont�nuo"')
            xlabel('t');
            ylabel('x(t)');
            plot(tnew,yrec(ik+1)*sinc(2*pi*fs*(tnew-ik*1/fs)),'k')
            axis([-Tf Tf -2 2]);
            
            subplot(2,1,2);
            plot(t,xv,'r');
            title('Sinal de "Tempo Cont�nuo"')
            xlabel('t');
            ylabel('x(t)');
            hold on;
            plot(tnew,x_recon,'k');