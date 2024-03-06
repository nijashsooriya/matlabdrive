clc 
close all
clear;

n = 0:255;
x = n>= 0 & n <= 15;
stem(n,x);

dft_x_256 = calculate_dft(x, 256);

figure(1)
subplot(2,1,1)
stem(real(dft_x_256)) 
xlabel("Frequency (rad)")
ylabel("Magnitude")
title("Magnitude plot of DFT, N = 256, Nijash S and Niveetha W")

subplot(2,1,2)
stem(real(fft(x, 256)))
xlabel("Frequency (rad)")
ylabel("Magnitude")
title("Magnitude plot of FFT, Nijash S and Niveetha W")


function dft = calculate_dft(x,N)
    dft = zeros(1, N);
    for freq_iter= 1:N
        for value_iter = 1:N
            dft(freq_iter) = dft(freq_iter) + x(value_iter)*exp((-2*1i*pi*value_iter*freq_iter)/N);
        end 
    end 
end 
