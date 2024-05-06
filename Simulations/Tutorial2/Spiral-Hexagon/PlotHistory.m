function fh = PlotHistory(t,zHist,nodes,elem,opts)

  % Time steps and number of nodes
  nt = length(t);
  n = size(zHist,2)/2; iU = 1:n; iV = n+iU;

  % Plot initial state
  fh = PlotState(zHist(1,:)',nodes,elem,opts);

  % Update dataset
  if nt > 1

    for i = 1:nt
      title = num2str(t(i));
      fuh = subplot(1,2,1); fuh.Children.CData = zHist(i,iU);
      fvh = subplot(1,2,2); fvh.Children.CData = zHist(i,iV);
      drawnow;
    end

  end

end
