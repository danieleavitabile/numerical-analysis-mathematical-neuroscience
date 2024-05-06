%% Clean
clear all, close all, clc;

%% Set path for input data
dataPath = '~/GitHub/utrecht-css-mathneuro-masterclass/Data/Spots-Disk/';

%% Toggle for generating or loading data
generateData = true;


%% Generate or load mesh 
if generateData 

  % Geometry and mesh parameters
  R = 30; hmax = 0.03; 

  % Create mesh, see file GenerateMesh.m
  mesh = GenerateMesh(R,hmax,dataPath);

else

  % Load mesh
  fileName = fullfile(dataPath,'mesh.mat');
  mesh = load(fileName);

end

%% Plot mesh
x = mesh.nodes(:,1); y = mesh.nodes(:,2); z = 0*x; 
trimesh(mesh.elements,x,y);
axis square

%% Plot function
[theta,rho] = cart2pol(x,y);
a = 10; b = 0.05; omega = 4;
u = a*exp(-b*rho).*(b*cos(rho) + sin(rho)).*cos(omega*theta);

plotOpts.clim = 'auto';
plotOpts.view = [0 90];

%% Plot showing mesh
PlotField(u,mesh.nodes,mesh.elements,plotOpts);
axis tight;

%% Interpolated plot
PlotField(u,mesh.nodes,mesh.elements,plotOpts);
shading interp; axis tight;

%% Function GenerateMesh.m 
% <include>GenerateMesh.m</include>

%% Function PlotField.m 
% <include>PlotField.m</include>
