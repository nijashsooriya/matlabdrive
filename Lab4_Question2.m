%Nijash Sooriyakumaran and Niveetha Wijendran

clear;
close all;
clc;

M  = 20;
w_cutoff = pi/3;
w_norm = [0 w_cutoff/(2*pi)];
a = [0 1];
b = firpm(M, w_norm, a)

freqz(b, M+1)