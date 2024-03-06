clc 
close all
clear;

% h1 = [1/4 1/2 1/4];
% h2 = [-1/4 1/2 -1/4];

N = 256;
w = 0:2*pi/(N-1):2*pi;

zero_pad = 0:255;
x = zero_pad>= 0 & zero_pad <= 15;

dtft_h1  = calculate_dtft(x, w);

figure(1)
subplot(2,1,1)
stem(real(dtft_h1)) 
xlabel("Frequency (rad)")
ylabel("Magnitude")
title("Magnitude plot of DTFT, Nijash S and Niveetha W")

% subplot(2,1,2)
% plot(w,(dtft_h2)) 
% xlabel("Frequency (rad)")
% ylabel("Magnitude")
% title("Magnitude plot of DTFT (h2), Nijash S and Niveetha W")


function dtft = calculate_dtft(x,freq)
    frequency_range = length(freq);
    %n = -ceil((length(x)-1)/2):floor((length(x)-1)/2);
    n = 0:floor((length(x)-1)/2);
    dtft = zeros(length(x), 1);
    for freq_iter= 1:frequency_range
        for value_iter = 1:length(n)
            %Using CT function brackets as DTFT is continuous in freq
            dtft(freq_iter) = dtft(freq_iter) + x(value_iter)*exp(-1i*(freq(freq_iter))*n(value_iter));
        end 
    end 
end 

