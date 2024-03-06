%Lab 4, Nijash Sooriyakumaran and Niveetha Wijendran
close all;
clear all;
clc;
w_c =  pi/3;

order = [20 50 150];
delta = [0.01 0.03 0.05];
for l = 1:length(order)
     for s = 1:length(delta)
        M = order(l);
        del = delta(s);
        f = [0 w_c/pi-del w_c/pi+del 1];
        a = [1 1 0 0];
        b = firpm(M,f,a);
    
        [h, w] = freqz(b, 1, 512);
    
        figure, 
        plot(w/pi, abs(h))
        title_loop = sprintf('Parks-McClellan of order = %d, Stopband Attenuation of =%f', M, del);
        title(title_loop)
        xlabel('Normalized Frequency (\omega/2\pi)');
        ylabel('Absolute value of Frequency Response of PM FIR')
     end
end 
