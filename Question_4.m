
syms u v
x = (5 + 3*cos(v))*cos(u);
y = (5 + 3*cos(v))*sin(u);
z = 7*sin(v);

ru = [diff(x,u) diff(y,u) diff(z,u)];
rv = [diff(x,v) diff(y,v) diff(z,v)];
r = sqrt(sum((cross(ru,rv)).^2));

A = int(int(r,u,0,2*pi),v,0,2*pi)
%Print answer
vpa(A,5)