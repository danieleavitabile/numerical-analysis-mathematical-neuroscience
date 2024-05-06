function SaveAnimation(t,uHist,nodes,elem,opts,fileName)

  video = VideoWriter(fileName,'MPEG-4');
  myVide.FrameRate = 10;
  open(video);

  % Time steps and number of nodes
  nt = length(t);

  % Plot initial state
  fh = PlotField(uHist(1,:)',nodes,elem,opts);
  set(gca,'visible','off');
  colorbar off;
  shading interp;

  % Update dataset
  if nt > 1

    for i = 2:nt
      fh.CData = uHist(i,:);
      drawnow;

      frame = getframe(gcf);
      writeVideo(video,frame);
    end

  end
  close(video);
  disp(sprintf('Saved file %s',fileName));
end
