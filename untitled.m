function y = func_1()

u =@(x,y)3*(1-3*x).^2.*exp(-2*x.^2 - (3*y+1).^2) ...
- 10*(3*x/5 - 27*x.^3 - 243*y.^5).*exp(-2*x.^2-6*y.^2) ...
- 1/3*exp(-(3*x+1).^2 - 9*y.^2) + (x.^2+y.^2) - 1;

%Input component values of t=5 to find height

z = u(-0.2200,0.6200)

end

