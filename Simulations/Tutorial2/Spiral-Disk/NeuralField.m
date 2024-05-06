function F = NeuralField(t,z,p,M)

  % Parameters
  mu    = p(1);
  theta = p(2);
  auu   = p(3);
  auv   = p(4);
  avu   = p(5);
  avv   = p(6);
  b     = p(7);
  tau   = p(8);

  % Split components
  n = size(z,1)/2; iU = 1:n; iV = n+iU;
  u = z(iU); v = z(iV);

  % Firing rate function
  S = @(u) 1./(1+exp(-mu*(u-theta)));

  % Right-hand side
  F = zeros(size(z));
  F(iU) =  -auu*u - auv*v + b*M*S(u);
  F(iV) = (-avu*u - avv*v)/tau;

end
