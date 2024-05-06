%% Clean
clear all, close all, clc;

%% Set path for input data
dataPath = '~/GitHub/utrecht-css-mathneuro-masterclass/Data/Spots-Disk/';

%% Load mesh
fileName = fullfile(dataPath,'mesh.mat');
mesh = load(fileName);

%% Plot mesh
x = mesh.nodes(:,1); y = mesh.nodes(:,2); z = mesh.nodes(:,3);

%% Plot function
[theta,rho] = cart2pol(x,y);
a = 10; b = 0.05; omega = 4;
u = 10*exp(-b*rho).*(b*cos(rho) + sin(rho)).*cos(4*theta);
fh = trisurf(mesh.elements,x,y,z,u);
view([0 90]); axis equal;
fh.EdgeColor = '#4C566A'; 
fh.EdgeAlpha = 0.4; 
colorbar;
