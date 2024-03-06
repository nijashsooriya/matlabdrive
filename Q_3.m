u = linspace(0, 2*pi, 40);
v = linspace(0,2*pi, 40);
[u,v] = meshgrid(u,v);


x = (5+3.*cos(v)).*cos(u);
y = (5+3.*cos(v)).*sin(u);
z = 7*sin(v);


surf(x,y,z);
title("Nijash Sooriyakumaran,400185321");
