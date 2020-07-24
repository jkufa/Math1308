% Project 2 -- Least Squares Fitting
% Jack Kufa

% Grab coords and put each entry in separate row
T = dlmread('data.txt');
x = T(1,1:10); x=x';
y = T(2,1:10); y = y';
% given degrees
n = [3; 5; 6];

% Plot Initial points
fig = figure("Name","Project 2","NumberTitle","off",'Renderer', 'painters', 'Position', [10 10 1200 675]);
plot(x,y,'ro','LineWidth',1, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k', 'MarkerSize' ,4)
lgd = legend('Initial Data Points'); grid on; hold on;

% For each degree, calculate Least Squares Fit
for i=1:size(n)
    % Vars that need to reset
    b2 = 0;
    A = [];
    
    % For polyfit, we need to find A for Ax*=b
    % A's dimensions are determined by the degree
    for idx=0:n(i,1)
        A = [A,x.^idx];
    end
    
    % Now find x* and b.
    xStar = (A'*A)\(A'*y); % use mldivide because it is more accurate than inverting
    b = A*xStar; % coefficients for both sets of linear equations
    
    % For trigfit, we need coefficients x*, degree, and x value
    for(j=size(xStar,1))
        b2 = b2 + xStar(j,1)*sin(j*x); 
    end
    
    % Calculate error
    e1 = sqrt(sum(abs(b-y).^2/size(x,1)));  % Poly
    e2 = sqrt(sum(abs(b2-y).^2/size(x,1))); % Trig
    disp("================================")
    disp("FOR N = " + n(i,1) + ":")
    disp("--------------------------------")
    disp("Polynomial LS Error = " + e1)
    disp("Trigonometric LS Error = "+ e2)
    disp("================================")
    fprintf('\n')
    
    % Plot fits
    plot(x,b,'LineWidth',2,'DisplayName',"Polynomial LS for N = " + n(i,1))
    plot(x,b2,'LineWidth',2,'DisplayName',"Trigonometric LS for N = " + n(i,1))
    % Do this so legend gets refreshed
    lgd = legend('off');lgd = legend('show');
    set(lgd,'color','none')
end
hold off

saveas(fig,'~/Octokitty/Work/School/Math1308/Project 2/graph.png');