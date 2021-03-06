T = dlmread('data.txt');
x = T(1,1:10);
x = x'; % X values in columns
y = T(2,1:10);
y = y'; % Y values in columns

n = 3;

% xStar = [sum(X.^2) sum(X); sum(X) size(X,1)]\[XY; sum(Y)];



yu = max(y);
yl = min(y);
yr = (yu-yl);                               % Range of ‘y’
yz = y-yu+(yr/2);
zx = x(yz .* circshift(yz,[0 1]) <= 0);     % Find zero-crossings
per = 2*mean(diff(zx));                     % Estimate period
ym = mean(y);                               % Estimate offset
fit = @(b,x)  b(1).*(sin(2*pi*x./b(2) + 2*pi/b(3))) + b(4);    % Function to fit
fcn = @(b) sum((fit(b,x) - y).^2);                              % Least-Squares cost function
s = fminsearch(fcn,[yr;per;-1;ym]);                       % Minimise Least-Squares
xp = linspace(min(x),max(x));
figure(1)
plot(x,y,'b',  xp,fit(s,xp), 'r')
grid