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
    H = [];
    for idx=0:N(i,1)
        H = [H,X.^idx];
    end
    A_star = inv(H'*H)*H'*Y;
    Y_tilde = H*A_star;
    
    % Compute Least Squares Error
    for j = 1:size(X)
%      disp("error = " + sum + " + (" + Y_tilde(j,1) + " - " + Y(j,1) + ")^2")
        sum = sum + (Y_tilde(j,1)-Y(j,1))^2; % Sum of Residuals
    end
    error = sqrt(sum); % LSE
    disp("Least Squares Error for N = " + N(i,1) + ": " + error)
    
    plot(X,Y_tilde,'LineWidth',2)
    % disp(Y_tilde)
end

hold off


% Sum of Residuals (Least Squares Error)
% error = (A*x1+b)-y1)^2+...+(A*xn+b)-yn)^2


% Sum of Residuals (Least Squares Error)
% error = (A*x1+b)-y1)^2+...+(A*xn+b)-yn)^2
% error = 0;
% for i1=1:size(N)
%     for j = 1:size(X)
%         disp("error = " + error + " + (" + Y_tilde(i2,1) + " - " + Y(i2,1) + ")^2")
%         error = error + (Y_tilde(j,1)-Y(j,1))^2;
%     end
%     disp("Least Squares Error for N = " + N(i1,1) + ": " + error)
% end