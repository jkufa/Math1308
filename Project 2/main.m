% LEAST SQUARES FITTING %

% Given Data
% x values: 1         1.2222   1.4444   1.6667  1.8889  2.1111      2.3333      2.5556       2.7778     3
% y values: -6.1666   8.3029   2.9989   5.484   4.6403  -3.70358    -0.656971   -4.67517     -14.1961   -8.72486

% Construct martrix
m = [1 1.2222 1.4444 1.6667 1.8889 2.1111 2.3333 2.5556 2.7778 3; -6.1666 8.3029 2.9989 5.484 4.6403 -3.70358 -0.656971 -4.67517 -14.1961 -8.72486];

% First, check to see if Ax=b is inconsistent
disp(m)

% Use Least squares to find x hat, xhat

% Find Least Squares Error, error
