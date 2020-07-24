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
% N = [3; 5; 6];
N = [6];
for i=1:size(N)
    error = 0;
    A = [];
    k = [0:N];
    for idx=0:N(i,1)
        A = [A,X.^idx];
    end
    b = (A'*A)\(A'*Y); % use mldivide because it is more accurate for inverting
    y_tilde = A*b;
    
    % y2_tilde = sin(A)*b;
    y2 = 0;
    for(j=size(b,1))
        y2 = y2 + b(j,1)*sin(j*X); 
    end
    
    e1 = sqrt(sum(abs(Y-y_tilde).^2/size(X,1))); % LSE maybe also divide by number of points
%     e2= sqrt(R2); % LSE
    disp("Polynomial LS Error for N = " + N(i,1) + ": " + e1)
%     disp("Trigonometric LS Error for N = " + N(i,1) + ": " + e2)
    % n polynomial approximation
    plot(X,y_tilde,'LineWidth',2)
    % n trigonometric approximation
%     plot(X,y2_tilde,'LineWidth',2)
    plot(X,y2,'LineWidth',2)

% pcoeff = polyfit(X,Y,6);
% yp = polyval(pcoeff,X);
% plot(X,yp,'k');

end


hold off