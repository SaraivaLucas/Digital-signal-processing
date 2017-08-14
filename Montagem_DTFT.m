clc;clear all;close all;
%% Parâmetros dado pelo professor:
n=0:0.04:10;
x=(0.9*exp(1j*pi/3)).^n;
M=500;
k=0:M-1;
w=pi*k/M;
X=dtft(x,n,w)