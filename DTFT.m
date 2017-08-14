function [] = dtft(x,n,w)
% X = valores da TFTD calculados em w pontos de frequências
% x = sequência de duração finita sobre n
% n = vetor de índices de tempo
% w = vetor de índices de frequência
M=length(w);                                    % Número de amostras do vetor ômega   
k=w*(M/pi);                                     % Reconstrução do vetor k
X=x*exp((-1j*pi/M).*(n'*k));                    % Equação da DTFT
plot(k/M,real(X))                               % Visualização no eixo k normalizado
