clc;clear all;close all;
%% Parâmetros dado pelo professor:
n=0:10;
x=(0.9*exp(1j*pi/3)).^n;
M=400;
k=0:M-1;
w=pi*k/M;
dtft(x,n,w)