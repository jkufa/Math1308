% LEAST SQUARES FITTING %

% Given Data
% x values: 1         1.2222   1.4444   1.6667  1.8889  2.1111      2.3333      2.5556       2.7778     3
% y values: -6.1666   8.3029   2.9989   5.484   4.6403  -3.70358    -0.656971   -4.67517     -14.1961   -8.72486

% Initialize n
n = 1;

% Construct martrices
% [n,x_values]x = y_values
x1 = [1; 1.2222; 1.4444; 1.6667; 1.8889; 2.1111; 2.3333; 2.5556; 2.7778; 3];
y1 = [-6.1666; 8.3029; 2.9989; 5.484; 4.6403; -3.70358; -0.656971; -4.67517; -14.1961; -8.72486]; %b is y values
x_hat = [];
error = 0;


% Construct A from n and x
for i = 1:size(x1,1)
c1 = repmat(n,size(x1,1),1);  % First column of A
end
A = [c1,x1];
A_t = A';

% Use Least squares to find x hat, x_hat
% augmented matrix
A2 = [A_t*A A_t*y1]; 
A2 = rref(A2);
for i = 1:size(A2,1)
    x_hat = [x_hat;A2(i,end)];
end

% Find Least Squares Error, error
% ||Ax-b||
Axb = A*x_hat - y1; % Graph this
for i = 1:size(Axb,1)
    error = error + Axb(i,1)^2;
end
error = sqrt(error);
disp(Axb)


% Generate plot points for plot (linear)
x2 = 0:4:5;
y2 = x2*x_hat(1) + x_hat(2);
plot(x2,y2)

% Generate plot points for plot (linear)
x3 = 0:.1:5;
y3 = x3*x_hat(2) + x_hat(1);
plot(x3,y3)

disp(x_hat)

