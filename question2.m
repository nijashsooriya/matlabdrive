clc 
close all
clear all

%Question 2ab
[impr, fs] = audioread('impr.wav');
plot(impr)
%soundsc(impr);
title("Impulsive Noise")
xlabel("Total Samples")
ylabel("Amplitude")
info = audioinfo("impr.wav")

%Question 2c
figure(2)
[y, fs] = audioread('oilyrag.wav');
subplot(2,1,1)
plot(y)
title("Supplied Speech Signal")
xlabel("Total Sample")
ylabel("Amplitude")
resultant_signal = conv(impr, y);
subplot(2,1,2)
plot(resultant_signal)
title("Convolution Response, Nijash Sooriyakumaran and Niveetha Wijendran")
xlabel("Total Samples")
ylabel("Amplitude")
%soundsc(y)
soundsc(resultant_signal)