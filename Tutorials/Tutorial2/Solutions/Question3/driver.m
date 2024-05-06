%% Cleaning
clear all, close all, clc;

%% Set path for input data
dataPath = '~/GitHub/utrecht-css-mathneuro-masterclass/Data/Spots-Disk/';
% dataPath = './';

%% Generate mesh and matrix data, or else load it
generateData = false;
saveAnimation = true;

%% Geometry and mesh parameters
R = 30; hmax = 0.03; % disk radius density mesh

%% Model Parameters
p(1) = 5.5; % mu
p(2) = 5.6; % theta
p(3) = 0.4; % b

%% Load or generate mesh, synaptic matrix, and FEM matrix
if generateData 

  % Mesh
  mesh = GenerateMesh(R,hmax,dataPath);

  % Synatpic Matrix
  b = p(3); wFun = @(r) exp(-b*r) .* (b*sin(r) + cos(r));
  W = GenerateSynapticMatrix(mesh.nodes,wFun,1e-3,dataPath);

  % FEM Matrix
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
u0 = 20./cosh(1/20*sqrt(x.^2 + y.^2)).^2;

%% Time step
rhs = @(t,u) NeuralField(t,u,p,M);
tspan = [0 50];
[t,uHist] = ode45(rhs,tspan,u0);

%% Animation
plotOpts.clim = [-2 3];
plotOpts.view = [0 90];
PlotHistory(t,uHist,mesh.nodes,mesh.elements,plotOpts);

%% Save animation to file
if saveAnimation
  fileName = fullfile(dataPath,'convering-hexagons.mp4');
  figure; SaveAnimation(t,uHist,mesh.nodes,mesh.elements,plotOpts,fileName);
end

%% Reset initial condition and restart 
u0 = uHist(end,:)' .* ( sqrt(x.^2 + y.^2) < 15 );

% Time step
p(1) = 6; % mu
rhs = @(t,u) NeuralField(t,u,p,M);
tspan = [0 100];
[t,uHist] = ode45(rhs,tspan,u0);

% Animation
PlotHistory(t,uHist,mesh.nodes,mesh.elements,plotOpts);

% Save animation to file
if saveAnimation
  fileName = fullfile(dataPath,'localised-hexagons.mp4');
  SaveAnimation(t,uHist,mesh.nodes,mesh.elements,plotOpts,fileName);
end

%%
% The simulation shows that localised equilibria can form near non-localised states.

%% Function GenerateMesh.m 
% <include>GenerateMesh.m</include>

%% Function PlotField.m 
% <include>PlotField.m</include>

%% Function GenerateFEMMatrix.m
% <include>GenerateFEMMatrix.m</include>

%% Function GenerateMesh.m
% <include>GenerateMesh.m</include>

%% Function GenerateSynapticMatrix.m
% <include>GenerateSynapticMatrix.m</include>

%% Function NeuralField.m
% <include>NeuralField.m</include>

%% Function PlotField.m
% <include>PlotField.m</include>

%% Function PlotHistory.m
% <include>PlotHistory.m</include>

%% Function SaveAnimation.m
% <include>SaveAnimation.m</include>

%% Function TriangleElementMeasure.m
% <include>TriangleElementMeasure.m</include>

