function F = NeuralField(t,u,p,M)

  % Parameters
  mu    = p(1);
  theta = p(2);

  % Firing rate function
  S = @(u) 1./(1+exp(-mu*u + theta)) - 1./(1+exp(theta));

  % Right-hand side
  F = -u + M*S(u);

end
