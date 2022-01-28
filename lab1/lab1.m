clear variables

% Himmelblau's data
%X = [infsup(-5, 5); infsup(-5, 5)];
%points = [3, 2; -2.805118, 3.131312; -3.77931, -3.283186; 3.584428, -1.848126];
%name = "Himmelblau's function";

% Bukin data
X = [infsup(-15, -5); infsup(-3, 3)];
points = [-10, 1];
name = "Bukin function №6";

% initialization
n = 100;
xGrid = linspace(inf(X(1)), sup(X(1)), n);
yGrid = linspace(inf(X(2)), sup(X(2)), n);
[xx, yy] = meshgrid(xGrid, yGrid);
%zz = Himmelblau(xx, yy);
zz = Bukin(xx, yy);

% plot function
figure
mesh(xx, yy, zz)
colorbar
hold on
title(name)
for i = 1 : size(points)
    plot3(points(i, 1), points(i, 2), 0, 'ob', "MarkerFaceColor", [1, 0, 0])
end

% plot algorithm step
figure
contour(xx, yy, zz, 'k')
hold on
title("Algorithm step")
[opt, worklist] = globopt0(X);
minVal = inf;
for b = worklist
    if b.Estim < minVal
        minVal = b.Estim;
    end
    plotintval(b.Box, 'n')
    hold on
end

% plot extremum distance
points = points';
dist = zeros(1, size(worklist, 2));
radBars = dist;
for i = 1 : size(worklist, 2)
    dist(1, i) = min(vecnorm(points - mid(worklist(i).Box)));
    radBars(1, i) = max(rad(worklist(i).Box));
end
figure
semilogy(dist, "LineWidth", 1)
hold on
title('Extremum distance')
xlabel('Iteration number')
ylabel('Distance')
xlim([0 size(worklist, 2)])

% plot bar radius
figure
semilogy(radBars, "LineWidth", 1)
hold on
title('Bar radius')
xlabel('Iteration number')
ylabel('Radius')
xlim([0 size(worklist, 2)])
