
x = 0:0.001:1;

dx = diff(x);
path_A = x;

dy = diff(path_A);
path_B = x.^3;
dy1 = diff(path_B);

%Calculating work along path A
Ax = -11*(path_A + 0.2).^3.6;
Ay = -39.6*(path_A + 0.2).^2.6.*x;
Path_A = sum(Ax(:,1:1000).*dx)+sum(Ay(:,1:1000).*dy)
%Calculating work along path B
Bx = -11*(path_B + 0.2).^3.6;
By = -39.6*(path_B + 0.2).^2.6.*x;
Path_B = sum(Bx(:,1:1000).*dx)+sum(By(:,1:1000).*dy1)

p = @(x,y) -x.*11*(y+0.2).^3.6;
W = p(1,1) - p(0,0)


