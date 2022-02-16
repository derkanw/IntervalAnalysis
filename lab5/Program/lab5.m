addpath(genpath('./m'))

x = [2; 5; 10; 14];       
y = [4; 8; 15; 23];        
epsilon = [1; 3; 2; 2]; 

% Evaluate beta
X = [ x.^0 x ];                               
start = [-inf 0];                                
beta = ir_problem(X, y, epsilon, start);
intB = ir_outer(beta);
beta
% Beta estimate
[rhoB, b1, b2] = ir_betadiam(beta);
b1
b2
maxdiag = (b1 + b2) / 2;
gravity = mean(ir_beta2poly(beta));
lsm = (X \ y)';

maxdiag
gravity
lsm

% Plot estimates
figure
ir_plotbeta(beta)
hold on
plot(maxdiag(1), maxdiag(2), ';max diagonals center;ro')
plot(gravity(1), gravity(2), ';gravity center;r+')
plot(lsm(1), lsm(2), ';LSM;rx')
grid on
legend()
xlabel('beta1')
ylabel('beta2')
title("Beta estimates")

% Corridor
figure
xlimits = [0 23];
ir_plotmodelset(beta, xlimits)
hold on
ir_scatter(beta,'b.')
grid on
xlabel('x')
ylabel('y')
title("Joint dependency corridor")

% Predictions
xp = [3; 6; 8; 11; 15];
Xp = [xp.^0 xp];
yp = ir_predict(beta, Xp);
yp