function M = GenerateFEMMatrix(mesh,W,dataPath)

  %% Determine if a files must be saved
  if nargin < 3 || isempty(dataPath)
    saveFiles = false;
  else
    saveFiles = true;
  end

  % Unpack mesh
  nodes = mesh.nodes;
  elem = mesh.elements;
  x = nodes(:,1); y = nodes(:,2); z = mesh.nodes(:,3); 
  n = length(x); numEl = size(elem,1);

  % Get nonzero global indices
  [row,col,wVal] = find(W);
  mVal = zeros(size(wVal)); 
  delta = zeros(size(wVal));
  txt = sprintf('Generating FEM matrix with nnz = %i...', length(mVal));
  disp(txt)

  % Compute measure of each element
  mu = zeros(numEl,1);
  parfor k = 1:numEl
    mu(k) = TriangleElementMeasure( x(elem(k,:)), y(elem(k,:)), z(elem(k,:)) );
  end

  % Integration weights over triangles
  q = 3; rho = ones(q,1)/6;

  % For each nonzero element in W
  parfor m = 1:length(wVal)
    
    % Every so often display progress
    if mod(m,floor(length(wVal)/5)) == 0
      txt = sprintf('      ...filled %i%% of the matrix', floor(100*m/length(wVal)));
      disp(txt)
    end

    % We are now at row(m), and we find elements including col(m):
    % col(m) is contained in element(s) k, at local index(ices) l.
    [k,l] = find(elem == col(m));

    % Sum all weights (note k, l are vectors), store weights in delta
    delta(m) = mu(k)' * rho(l);
    mVal(m) = wVal(m) * delta(m);

  end

  % Ensure only nonzero elements are retained
  idnnz = find(mVal); 
  row = row(idnnz); col = col(idnnz); mVal = mVal(idnnz); delta = delta(idnnz);

  %% Make the matrix sparse, and save it to file
  M = sparse(row,col,mVal,n,n);

  %% Default file names
  if saveFiles

    % Set file names
    matFile = fullfile(dataPath,'fem-matrix.mat');
    datFile = fullfile(dataPath,'fem-matrix.dat');

    % Save .mat file
    save(matFile,'M');
    disp(sprintf('Saved file %s',matFile));

    % Save .dat file
    fileID = fopen(datFile,'w');
    fprintf(fileID,'#%12s %12s\n', 'numRows', 'numCols');
    fprintf(fileID,' %12i %12i\n', n, n);
    fprintf(fileID,'# Nonzero elements\n');
    fprintf(fileID,'#%12s %12s %20.12s\n', 'i', 'j', 'value');
    fprintf(fileID,' %12i %12i %20.12e\n', row, col, mVal);
    fclose(fileID);
    disp(sprintf('Saved file %s',datFile));

  end
  
end
