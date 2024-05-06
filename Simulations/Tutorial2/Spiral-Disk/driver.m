%% Cleaning
clear all, close all, clc;

%% Set path for input data
dataPath = '~/GitHub/utrecht-css-mathneuro-masterclass/Data/Spiral-Disk/';
% dataPath = './';

%% Generate mesh and matrix data, or else load it; save animation
generateData = true;
saveAnimation = false;

%% Geometry and mesh parameters
R = 30; hmax = 0.03; % disk radius, meshsize

%% Model Parameters
p(1) = 20; % mu    
p(2) = 0.6; % theta 
p(3) = 1; % auu   
p(4) = 2; % auv   
p(5) = -2.2; % avu   
p(6) = 1; % avv   
p(7) = 3.5; % b     
p(8) = 5; % tau   

%% Load or generate mesh, synaptic matrix, and FEM matrix
if generateData

  % Mesh
  mesh = GenerateMesh(R,hmax,dataPath);

  % Synaptic matrix 
  r = linspace(-60,60,1000);
  w = SynapticKernelBessel(r);
  wFun = griddedInterpolant(r,w);
  W = GenerateSynapticMatrix(mesh.nodes,wFun,1e-3,dataPath);

  % FEM matrix
  M = GenerateFEMMatrix(mesh,W,dataPath);

else

  % Mesh
  fileName = fullfile(dataPath,'mesh.mat');
  mesh = load(fileName);

  % Synaptic matrix
  fileName = fullfile(dataPath,'synaptic-matrix.mat');
  data = load(fileName); W = data.W;

  % FEM matrix
  fileName = fullfile(dataPath,'fem-matrix.mat');
  data = load(fileName); M = data.M;

end

%% Initial condition
x = mesh.nodes(:,1); y = mesh.nodes(:,2); n = length(x);
iU = 1:n; iV = n+iU;
u0 = zeros(n,1); u0(find(y > 0)) = 1;
v0 = zeros(n,1); v0(find(x < 0)) = 4;
% u0 = 20./cosh(1/20*sqrt(x.^2 + y.^2)).^2.*atan(y./x) + 10*rand(size(x));
% v0 = 20./cosh(1/20*sqrt(x.^2 + y.^2)).^2.*atan(y./x) + 10*rand(size(x));
z0 = [u0; v0];

%% Time step
rhs = @(t,u) NeuralField(t,u,p,M);
tspan = [0 50];
[t,zHist] = ode45(rhs,tspan,z0);

%% Animation
plotOpts.U.clim = [-2 5];
plotOpts.U.view = [0 90];
plotOpts.U.xlim = [-R R];
plotOpts.U.ylim = [-R R];
plotOpts.U.axis = 'equal';
plotOpts.V = plotOpts.U;
PlotHistory(t,zHist,mesh.nodes,mesh.elements,plotOpts);

%% Save animation to file
if saveAnimation
  figure; SaveAnimation(t,zHist(:,iU),mesh.nodes,mesh.elements,plotOpts.U,'./');
end

