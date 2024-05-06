%% Clean
clear all, close all, clc;

%% Set path for input data
dataPath = '~/GitHub/utrecht-css-mathneuro-masterclass/Data/Spots-Disk/';

%% Toggle for generating or loading data
generateData = false;

%% Generate or load mesh 
if generateData 

  % Geometry and mesh parameters
  R = 30; hmax = 0.03; 

  % Create mesh, see file GenerateMesh.m
  mesh = GenerateMesh(R,hmax,dataPath);

  % Synatpic Matrix
  b = 0.4; wFun = @(r) exp(-b*r) .* (b*sin(r) + cos(r));
  W = GenerateSynapticMatrix(mesh.nodes,wFun,1e-3,dataPath);

  % FEM Matrix
  M = GenerateFEMMatrix(mesh,W,dataPath);

else

  % Load mesh
  fileName = fullfile(dataPath,'mesh.mat');
  mesh = load(fileName);

  % Synaptic matrix
  fileName = fullfile(dataPath,'synaptic-matrix.mat');
  data = load(fileName); W = data.W;

  % FEM matrix
  fileName = fullfile(dataPath,'fem-matrix.mat');
  data = load(fileName); M = data.M;

end

%% Plot sparsity pattern of the matrix
figure
spy(M); title('Sparsity pattern of the matrix M')

%% Plot of the synaptic connections of node 2000;
id = 2000;
plotOpts.clim = 'auto';
plotOpts.view = [0 90];
figure;
PlotField(W(:,id),mesh.nodes,mesh.elements,plotOpts);

%% Function GenerateFEMMatrix.m
% <include>GenerateFEMMatrix.m</include>

%% Function GenerateMesh.m
% <include>GenerateMesh.m</include>

%% Function GenerateSynapticMatrix.m
% <include>GenerateSynapticMatrix.m</include>

% %% Plot mesh
% x = mesh.nodes(:,1); y = mesh.nodes(:,2); z = 0*x; 
% trimesh(mesh.elements,x,y);
% axis square

% %% Plot function
% [theta,rho] = cart2pol(x,y);
% a = 10; b = 0.05; omega = 4;
% u = a*exp(-b*rho).*(b*cos(rho) + sin(rho)).*cos(omega*theta);

% plotOpts.clim = 'auto';
% plotOpts.view = [0 90];

% %% Plot showing mesh
% PlotField(u,mesh.nodes,mesh.elements,plotOpts);
% axis tight;

% %% Interpolated plot
% PlotField(u,mesh.nodes,mesh.elements,plotOpts);
% shading interp; axis tight;

%% Function GenerateMesh.m 
% <include>GenerateMesh.m</include>

%% Function PlotField.m 
% <include>PlotField.m</include>
