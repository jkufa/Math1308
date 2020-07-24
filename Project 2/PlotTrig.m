% LEAST SQUARES FITTING %

% Given Data
% x values: 1         1.2222   1.4444   1.6667  1.8889  2.1111      2.3333      2.5556       2.7778     3
% y values: -6.1666   8.3029   2.9989   5.484   4.6403  -3.70358    -0.656971   -4.67517     -14.1961   -8.72486


% Construct martrices
% [n,x_values]x = y_values
X = [1; 1.2222; 1.4444; 1.6667; 1.8889; 2.1111; 2.3333; 2.5556; 2.7778; 3];
Y = [-6.1666; 8.3029; 2.9989; 5.484; 4.6403; -3.70358; -0.656971; -4.67517; -14.1961; -8.72486]; %b is y values

p = polyfit(X,Y,6);
x1 = coefficients (1)
y1 = coefficients (2)
disp(p)
plot(X,Y);
plot(x1,y1);

f = polyval(p,X);
T = table(X,Y,f,Y-f,'VariableNames',{'X','Y','Fit','FitError'})