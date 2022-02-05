C = kinterval([2, 0; 1, 1], [5, 1; 2, 4]);
x = kinterval([-1; 0], [1; 1]);
d = kinterval([-2; -1], [1; 4]);

n = 10;
E = innerminus(C, diag(diag(C)));

% Bars illustration
figure
drawBox(x, 'b')

xi = [x];
invD = diag(inv(diag(C)));
for i = 1 : n
    x = invD * innerminus(d, E * x);
    xi = [xi x];
    drawBox(x, '')
end
x = invD * innerminus(d, E * x);
xi = [xi x];
drawBox(x, 'r')
title("Iteration scheme")
x

% Solution radius
figure
rads = rad(xi);
plot(rads(1, :))
hold on
plot(rads(2, :))
hold on
title("Solution radius")
legend('x1', 'x2')

%%%   neuton   %%%
A = kinterval([3 5;-1 -3], [4 6;1 1]);
b1 = kinterval([-3;-1], [3;2]);
b2 = kinterval([-3;-1],[4;2]);

xi1 = [0 0.5 0.75 0.8889 0.5 0.2 0 -0.75 -0.8235 0;0.3333 0.1667 0 -0.1111 -0.5 -0.6 -0.5 0 0.0588 0.3333];
xi2 = [0 1 0.5 0.2 0 -0.75 -0.8236 0;0.3333 0 -0.5 -0.6 -0.5 0 0.0588 0.3333];


[x1, opt1, history1] = subdiff(A, b1);

opt1.tau = 1;
opt1.max_iterations_num = 200;
[x2, opt2, history2] = subdiff(A, b2, opt1);
opt1.tau = 0.05;
opt1.max_iterations_num = 200;
[x3, opt3, history3] = subdiff(A, b2, opt1);


figure
x = history1(:, 1);
drawBox(x, 'g')
for i=2:size(history1, 2) - 1
    x = history1(:, i);
    drawBox(x, 'k-')
endfor
i = size(history1, 2);
x = history1(:, i);
drawBox(x, 'r')
plot(xi1(1,:), xi1(2,:), '--')

figure
x = history2(:, 1);
drawBox(x, 'g')
for i=2:size(history2, 2) - 1
    x = history2(:, i);
    drawBox(x, 'k-')
endfor
i = size(history2, 2);
x = history2(:, i);
drawBox(x, 'r')
plot(xi2(1,:), xi2(2,:), '--')

figure
x = history3(:, 1);
drawBox(x, 'g')
for i=2:size(history3, 2) - 1
    x = history3(:, i);
    drawBox(x, 'k-')
endfor
i = size(history3, 2);
x = history3(:, i);
drawBox(x, 'r')
plot(xi2(1,:), xi2(2,:), '--')