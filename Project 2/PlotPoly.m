% LEAST SQUARES FITTING %

% Given Data
% x values: 1         1.2222   1.4444   1.6667  1.8889  2.1111      2.3333      2.5556       2.7778     3
% y values: -6.1666   8.3029   2.9989   5.484   4.6403  -3.70358    -0.656971   -4.67517     -14.1961   -8.72486


% Construct martrices
% [n,x_values]x = y_values
X = [1; 1.2222; 1.4444; 1.6667; 1.8889; 2.1111; 2.3333; 2.5556; 2.7778; 3];
Y = [-6.1666; 8.3029; 2.9989; 5.484; 4.6403; -3.70358; -0.656971; -4.67517; -14.1961; -8.72486]; %b is y values


% Initial plot
plot(X,Y,'rs','LineWidth',1, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g', 'MarkerSize' ,3)
grid on
hold on


% Y = HA
N = [3; 5; 7];
% N = [3];
for i=1:size(N)
    sum = 0;
    error = 0;
    temp = 1;
    A = [];
    A2 =[];
    Y2 = [];
    for idx=0:N(i,1)
%       disp(idx)
        A = [A,X.^idx];
        A2 = [A2,sin(X*idx)];
    end
    b = (A'*A)\(A'*Y); % use mldivide because it is more accu rate for inverting
    b2 = (A2'*A2)\(A2'*Y);
    y_tilde = A*b; % b = (A'A)^-1 * X'y
    y2_tilde = A2*b2;

    for j = 1:size(X)
        % Compute y values for n Trigonometric Polynomial Approximation
        temp = temp * sin(j*X(j));
        disp(Y2)
        Y2 = [Y2,temp];

        % Compute Least Squares Error
        sum = sum + (y_tilde(j,1)-Y(j,1))^2; % Sum of Residuals
    end
    error = sqrt(sum); % LSE
    disp("Least Squares Error for N = " + N(i,1) + ": " + error)
    % n polynomial approximation
    plot(X,y_tilde,'LineWidth',2)
    % n trigonometric approximation
    plot(X,y2_tilde,'LineWidth',2)

end


hold off