function mesh = GenerateMesh(r,hmax,dataPath)

  %% Determine if files must be saved
  if nargin < 3 || isempty(dataPath)
    saveFiles = false;
  else
    saveFiles = true;
  end

  %% Generate mesh of a hexagon inscribed in a unit disk using Matlab's PDE toolbox routines. 
  theta = [0:5]'*pi/3; x = cos(theta); y = sin(theta);
  hex = decsg([2;6;x;y]);
  model = createpde();
  geometryFromEdges(model,hex);

  % Specify a maximal element size
  mesh = generateMesh(model,"Hmax",hmax,GeometricOrder="linear");

  % Fetch triangulation, 
  nodes = mesh.Nodes';
  elements = mesh.Elements';

  %% Rescale nodes to the disc or radius r, add z = 0 coordinate
  x = nodes(:,1); y = nodes(:,2); z = zeros(size(x));
  [theta,rho] = cart2pol(x,y);
  [x,y] = pol2cart(theta, r*rho);
  nodes = [x, y, z];

  %% Finalise output
  mesh = [];
  mesh.nodes = nodes;
  mesh.elements = elements;

  if saveFiles

    % Set filenames
    meshFile = fullfile(dataPath,'mesh.mat');
    nodesFile = fullfile(dataPath,'nodes.dat');
    elementsFile = fullfile(dataPath,'elements.dat');

    % Save mesh to .mat file
    save(meshFile,'nodes','elements');
    disp(sprintf('Saved file %s',meshFile));

    % Save nodes to text file
    fileID = fopen(nodesFile,'w');
    fprintf(fileID,'#%16.12s %16.12s %16.12s\n', 'x', 'y', 'z');
    fprintf(fileID,' %16.12f %16.12f %16.12f\n', [x y z]');
    fclose(fileID);
    disp(sprintf('Saved file %s',nodesFile));
      
    % Save elements to text file
    fileID = fopen(elementsFile,'w');
    fprintf(fileID,'# %12s %12s %12s\n', 'node 1', 'node2', 'node3');
    fprintf(fileID,'  %12i %12i %12i\n', elements');
    fclose(fileID);
    disp(sprintf('Saved file %s',elementsFile));
  end

end
