function F = NeuralField(t,z,p,M)

  % Parameters
  mu    = p(1);
  theta = p(2);
  alpha = p(3);
  beta  = p(4);
  gamma = p(5);
  delta = p(6);
  nu    = p(7);
  tau   = p(8);

  % Split components
  n = size(z,1)/2; iU = 1:n; iV = n+iU;
  u = z(iU); v = z(iV);

  % Firing rate function
  S = @(u) 1./(1+exp(-mu*(u-theta)));

  % Right-hand side
  F = zeros(size(z));
  F(iU) =  -alpha*u - beta*v + nu*M*S(u);
  F(iV) = (-gamma*u - delta*v)/tau;

end
