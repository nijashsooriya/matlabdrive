fs = 8000; f1 = 1500; f2 = 750;
L = 8000*5; n = (0:L-1);
A = 1/5; % adjust playback volume
x1 = A * cos(2 * pi * n * f1 / fs);
x2 = A * cos(2 * pi * n * f2 / fs);
x = x1 + x2;

[b, a] = butter(10, 0.5, 'low');
wc = pi*(0:0.001:0.5);
gd = grpdelay(b, a, wc);

plot(wc/pi, gd)
grid on;
xlabel('Normalized Frequency \times\pi rad/sample')
ylabel('Group Delay (sample)')