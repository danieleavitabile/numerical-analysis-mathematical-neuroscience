%% Clean
clear all, close all, clc;

%% Parameters
mu = 10; theta  = 0.5; sigma = 1.5; A = 1.8;

%% Spatial grid
n = 2^10; L = 10*pi; dx = 2*L/n; x = -L+[0:n-1]'*dx;

%% Funcion handles for the synaptic kernel
wFun = @(r) 1/sqrt(pi)*exp(-r.^2)- 1/(sqrt(pi)*sigma)*exp(-(r/sigma).^2); 
% wHatFun = @(xi) ( exp(-xi.^2/4) - exp(-(xi*sigma).^2/4) );

%% Funcion handles for the firing rate functions
S  = @(u) 1./(1+exp(-mu*u+theta)) - 1./(1+exp(theta)); 

%% Simulation performed using matrix-vector multiplication

% Compose matrix (ring geometry)
M = zeros(n,n);
y = wFun(x)*dx;
iRows = 1:n;
iShift = -n/2:n/2-1;
for i = 1:n
  M(iRows(i),:) = circshift(y, iShift(i));
end

% Time step
rhs = @(t,u) -u + A*M*S(u);
u0 = 0.1*rand(size(x));
tic
[t,U1] = ode45(rhs,[0 100],u0);
toc

%% Simulation performed using FFT to evaluate the RHS

% Time step
wHat = fft(wFun(x));
p = [theta; mu; A];
rhs = @(t,u) NeuralField(u,p,wHat,dx);
tic
[t,U2] = ode45(rhs,[0 100],u0);
toc

figure;
subplot(2,2,[1 3]);
[X,T]= meshgrid(x,t);  
surf(X,T,U1); view([0 90]); shading interp;
xlabel('x'); ylabel('t'); zlabel('u(x,t)');
axis tight; colorbar;
subplot(2,2,[2 4]);
[X,T]= meshgrid(x,t);  
surf(X,T,U1); view([0 90]); shading interp;
xlabel('x'); ylabel('t'); zlabel('u(x,t)');
axis tight; colorbar;
