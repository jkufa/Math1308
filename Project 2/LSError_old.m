T = dlmread('data.txt');
X = T(1,1:10);
X = X'; % X values in columns
Y = T(2,1:10);
Y = Y'; % Y values in columns

% Objective: construct Ax+By=C from given data points
LinEq = [];
for i=2:size(X,1)
   test1 =  Y(i-1,1);
    test2 = Y(i,1);
    m = (Y(i,1) - Y(i-1,1))/(X(i,1)-X(i-1,1));
    coefA = -m; %m*-1 since you move to other side (-m*x)
    coefB = 1; % always 1
    C = m*X(i-1,1); % slope * X1
    LinEq = [LinEq; coefA coefB C];
end


% Now construct matrix A and b* for Ax=b
A = LinEq(:,[1,size(LinEq,2)-1]);
b = LinEq(:,end);

% find x* (this eleminates need for explict row reduction)
xStar = (A'*A)\(A'*b); % Use mldivide since it's more accurate than inverse

% Normalize
temp = A*xStar-b; %temp matrix
norm = 0;
for i=1:size(temp,1)
    norm = norm + temp(i,1)^2;
    disp(norm)
end

% Compute LSError
error = sqrt(norm);