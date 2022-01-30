clear variables
% Matrix
a = 3;
b = 6;
c = infsup(1, 6);
k = infsup(1, 5);
A = [a, b; 1, -k];
h = [c; 0];

% Linear
n = 20;
name = "Linear task";
L = inv(mid(A));
C = eye(2) - L * A;
eta = mag(norm(C, "inf"));
theta = mag(norm(L*h, "inf")) / (1 - eta);
startBar = [midrad(0, theta); midrad(0, theta)];

% Non-linear
% n = 200;
% name = "Non-linear task";
% J = @(x) [a b; 1 / x(2), - x(1) ./ (x(2) * x(2))];
% startBar = [infsup(0.1, 5); infsup(0.1, 4)];
% L = @(x) inv(mid(J(x)));
% C = @(x) eye(2) - L(x) * J(x);
% F = @(x) [a * x(1) + b * x(2) - c;x(1) ./ x(2) - k];
% K = @(x) mid(x) - L(x) * F(mid(x)) - C(x) * (x - mid(x));

%Kravchik
bars = [startBar];
x = startBar;
for i = 1 : n
    x = intersect(L * h + C * x, x);
    %x = intersect(K(x), x);
    bars = [bars x];
end

figure
EqnWeakR2(inf(A), sup(A), inf(h), sup(h));
plotintval(bars, 'n')
grid on
title(name)

% Radius and distance
rads = zeros(2, size(bars, 2));
dist = zeros(1, size(bars, 2));
center = mid(bars(:, size(bars, 2)));
for i = 1 : size(bars, 2)
    rads(:, i) = rad(bars(:, i));
    dist(1, i) = norm(mid(bars(:, i)) - center);
end

figure
plot(rads(1, :))
hold on
plot(rads(2, :))
title(name)
ylabel('Radius')
xlabel('Iteration')
legend('horizontal', 'vertical')
grid on

figure 
semilogy(dist)
title(name)
ylabel('Distance')
xlabel('Iteration')
grid on