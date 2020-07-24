% Project 2 -- Least Squares Fitting
% Jack Kufa

% Grab coords and put each entry in separate row
T = dlmread('data.txt');
x = T(1,1:10); x=x';
y = T(2,1:10); y = y';
% given degrees
n = [3; 5; 6];
% n = [3];

% Plot Initial points
fig = figure("Name","Project 2","NumberTitle","off",'Renderer', 'painters', 'Position', [10 10 1200 675]);
plot(x,y,'ro','LineWidth',1, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k', 'MarkerSize' ,4)
lgd = legend('Initial Data Points'); grid on; hold on;

% For each degree, calculate Least Squares Fit
for i=1:size(n)
    % Vars that need to reset\
    A = []; % for polyfit
    A2 = []; % for trig fit
    
    % For polyfit, we need to find A for Ax*=b
    % A's dimensions are determined by the degree
    for idx=0:n(i,1)
        A = [A,x.^idx];
        if idx ~= 0
            A2 = [A2,sin(x*idx)];
        end
    end
    
    % Now find x* and b.
    % Use row reduction in case of inconsistent data
    % Polyfit coefficients
    xStar = rref([A'*A A'*y]); 
    xStar = xStar(:,end);
    % Trigfit coefficients
    x2Star = rref([A2'*A2 A2'*y]);
    x2Star = x2Star(:,end);
    
    % Grab new y matrix
    b = A*xStar;
    b2 = A2*x2Star;
    
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