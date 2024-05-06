clear all, close all, clc
n = 10; L = 10*pi; dx = 2*L/n; x = -L+[0:n-1]'*dx;

%% Compose matrix (ring geometry)
W = zeros(n,n);
y = 1:n;
iRows = 1:n;
iShift = -n/2:n/2-1;
for i = 1:n
  W(iRows(i),:) = circshift(y, iShift(i));
end

