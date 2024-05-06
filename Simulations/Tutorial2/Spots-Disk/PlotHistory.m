function fh = PlotHistory(t,uHist,nodes,elem,opts)

  % Time steps
  nt = length(t);

  % Plot initial state
  fh = PlotField(uHist(1,:)',nodes,elem,opts);
  % shading interp;

  % Update dataset
  if nt > 1

    for i = 1:nt
      title = num2str(t(i));
      fh.CData = uHist(i,:);
      drawnow;
    end

  end

end
