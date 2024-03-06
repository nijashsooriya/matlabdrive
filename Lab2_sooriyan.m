%NIJASH SOORIYAKUMARAN, 400185321, ELECENG3KF4 LAB 2

clear;
close all;
%Initialize constants
epsilon = 8.854e-12;
mu = 1/(4*pi*10^-7);
%Meshgrid for magnetic field lines

[xPoint,yPoint] = meshgrid(linspace(-10,10,20),linspace(-10,10,20));

%Contour line meshgrid

[xContour,yContour] = meshgrid(linspace(-10,10,10),linspace(-10,10,10));

%Giving each charge a value

topWire = 5;
%Negative 5 to connotate the opposite flow of current hence opposite
%magnetic field
bottomWire = -5;


%Wire position initializations
topWirex = xPoint;
topWirey = yPoint+1;

bottomWirex = xPoint;
bottomWirey = yPoint-1;

length1 = sqrt(topWirex.^2+topWirey.^2);
length2 = sqrt(bottomWirex.^2+bottomWirey.^2);

%Calculating X-Component
Hx1 = mu.*topWire.*(-sin(atan2(topWirey,topWirex)))./(2*pi*length1);
Hx2 = mu.*bottomWire.*(-sin(atan2(bottomWirey,bottomWirex)))./(2*pi*length2);
%Calculating Y-Component
Hy1 = mu.*topWire.*(cos(atan2(topWirey,topWirex)))./(2*pi*length1);
Hy2 = mu.*bottomWire.*(cos(atan2(bottomWirey,bottomWirex)))./(2*pi*length2);
%Sum up all components
Hx = Hx1+Hx2;
Hy = Hy1 +Hy2;

H = sqrt(Hx.^2+Hy.^2);
%Normalize magnetic flux vectors
normalizedX = Hx./H;
normalizedY = Hy./H;
%Plot magnetic vector field
holdH = quiver(xPoint,yPoint,normalizedX,normalizedY)
%Plotting contour lines
streamline(xPoint,yPoint,normalizedX,normalizedY,xContour,yContour)
axis([-8 8 -8 8]);
axis equal;

title('Magnetic Field of Infinite Wire and Image Wire, Nijash Sooriyakumaran 400185321')

%If you wish to simply look at the top half, without the image wire:
%xlim([-8 8])
%ylim([0 8])