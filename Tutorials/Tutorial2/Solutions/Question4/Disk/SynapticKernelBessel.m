function w = SynapticKernelBessel(r)

  f = @(s) s*besselj(0,r*s)/(s^4+s^2+1);
  w = integral(f,0,1000,'ArrayValued',true);

end
