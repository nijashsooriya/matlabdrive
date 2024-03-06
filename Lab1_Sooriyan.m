%NIJASH SOORIYAKUMARAN, 400185321, ELECENG3KF4 LAB 1

clear;
close all;
clc;

%Declaring constants used 

e0 = 8.854e-12;
k = 1/(4*pi*e0);

%Constructing the mesh grid for Electric Field
%Number of points 
points = 50;
%Bounds for mesh
xMin =  -10;
xMax = 10;
yMin = -10;
yMax = 10;

meshX = linspace(xMin,xMax,points);
meshY = linspace(yMin,yMax,points); 

[xElec,yElec] = meshgrid(meshX,meshY);


%Constructing the mesh grid for Contour Lines

contourPoints = 25;

%Bounds for mesh
xCMin =  -10;
xCMax = 10;
yCMin = -10;
yCMax = 10;


meshCX = linspace(xCMin,xCMax,contourPoints);
meshCY = linspace(yCMin,yCMax,contourPoints); 

[xContour,yContour] = meshgrid(meshCX,meshCY);

%Value of the charges 
QPos = 0.5;
%For above, charges 1 and 3 are positive
QNeg = -0.5;


%Charge positioning

x1 = 1;
y1 = 1;

x2 = 1;
y2 = -1;

x3 = -1;
y3 =1;

x4 =-1;
y4 = -1;

%Calculating the electric field for the first

rX = xElec - x1;
rY = yElec - y1;
r = sqrt(rX.^2 + rY.^2).^3;
elecX = k.*QPos.*rX./r;
elecY = k.*QPos.*rY./r;

%Calculating the electric field for the second

rX = xElec - x2;
rY = yElec - y2;
r = sqrt(rX.^2 + rY.^2).^3;
%Summing the previous components of the electric fields together
elecX = elecX + k.*QNeg.*rX./r;
elecY = elecY + k.*QNeg.*rY./r;

%Calculating the electric field for the third

rX = xElec - x3;
rY = yElec - y3;
r = sqrt(rX.^2 + rY.^2).^3;
elecX = elecX + k.*QNeg.*rX./r;
elecY = elecY + k.*QNeg.*rY./r;

%Calculating electric field for the fourth

rX = xElec - x4;
rY = yElec - y4;
r = sqrt(rX.^2 + rY.^2).^3;
elecX = elecX + k.*QPos.*rX./r;
elecY = elecY + k.*QPos.*rY./r;
%Total Electric Summation
totalElec = sqrt(elecX.^2 + elecY.^2);

xNormal = elecX./totalElec;
yNormal=elecY./totalElec;

%Creating Electric Field plot 
figure();
electricField=quiver(xElec,yElec,xNormal,yNormal)
%Creating the contour lines
streamline(xElec,yElec,xNormal,yNormal,xContour,yContour)
%Plotting the charge
rectangle('Position',[0.6 0.6 .65 .65],'Curvature',1)
axis equal
%Making sure that the images of the charge are not shown in solution
xlim([0 5])
ylim([0 5])
