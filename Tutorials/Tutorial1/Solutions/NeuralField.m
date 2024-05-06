function F = NeuralField(u,p,wHat,dx)

  %% Rename parameters
  theta = p(1);
  mu    = p(2);
  A     = p(3);
  n = size(u,1);

  %% Firing rate function
  f = 1./(1+exp(-mu*u+theta)) - 1./(1+exp(theta)); 
  fHat = fft(f);

  %% Right-hand side
  F = zeros(n,1);
  F = - u + A*dx*ifftshift(real(ifft(fHat .* wHat)));
  

end
