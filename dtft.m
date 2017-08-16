function [X] = dtft(x,n,w)                          
% X = valores da TFTD calculados em w pontos de frequências
% x = sequência de duração finita sobre n
% n = vetor de índices de tempo
% w = vetor de índices de frequência
M=floor(length(w));                                    % Número de amostras do vetor ômega   
k=w*(M/pi);                                            % Reconstrução do vetor k
X=x*exp((-1j*pi/M).*(n'*k));                           % Equação da DTFT

%% Plotting
figure ()
hold on
title('Espectro de X(e^j^w)')
plot(w/pi,abs(X));
plot(w/pi,real(X));
plot(w/pi,imag(X));
grid;legend('Magnitude de X(e^j^w)','Parte Real de X(e^j^w)','Parte Imaginária de X(e^j^w)')
legend('Location','Northwest')
ylabel('Espéctro de x(n)')
xlabel('\pi')