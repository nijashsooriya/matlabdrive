clear all 
close all
clc

w_c = pi/3;
order = [20 50 150];
sidelobe = [10 48 148];

for l = 1:length(order)
     for s = 1:length(sidelobe)
         M = order(l);
         sideband_attenuation = sidelobe(s);
%          [b, a] = cheby2(M, sideband_attenuation, w_c/pi);
%          fvtool(b,a)
         [z, p, k] = cheby2(M, sideband_attenuation, w_c/pi);
         sos = zp2sos(z, p, k);
         [h, w] = freqz(sos, 'whole');
         figure
         plot(w/(2*pi), abs(h))
         title_loop = sprintf('Chebyshev Type II, Order = %d, Stopband Attenuation of = %f', M, sideband_attenuation);
         title(title_loop)
         xlabel('Normalized Frequency (\omega/2\pi)');
         ylabel('Absolute value of Frequency Response of Chebyshev  II IIR')
     end
end




