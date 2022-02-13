% ISLAU coefficients
A = [infsup(1, 2), infsup(0, 5); 1, -infsup(1, 2); infsup(1, 3), 0];
b = [infsup(2, 8); 0; infsup(5, 8)];

% Recognizing functional
Tol = @(A,b,x) min(rad(b) - mag(mid(b) - A * x));

% Original matrix
disp("Original matrix")
[tolMax, argMax, ~, ~] = tolsolvty(inf(A), sup(A), inf(b), sup(b));
tolMax
argMax
drawContour(A, b, argMax, "Original ISLAU")

% Correct vector b
disp("Correct vector b")
e = [infsup(-1, 1); infsup(-1, 1); infsup(-1, 1)];
coeff = 1.2;
C = coeff * abs(tolMax);
b1 = b + C * e;
[tolMax1, argMax1, ~, ~] = tolsolvty(inf(A), sup(A), inf(b1), sup(b1));
ive1 = ive(A, b1);
rve1 = rve(A, tolMax1);
iveBox = [midrad(argMax1(1), ive1); midrad(argMax1(2), ive1)];
rveBox = [midrad(argMax1(1), rve1); midrad(argMax1(2), rve1)];
b1
tolMax1
argMax1
ive1
rve1
drawContour(A, b1, argMax1, "Correct vector b")
plotintval([iveBox, rveBox], 'n');

% Correct matrix A
disp("Correct matrix A")
b2 = [infsup(2, 8); infsup(-1, 1); infsup(5, 8)];
[tolMax2, argMax2, ~, ~] = tolsolvty(inf(A), sup(A), inf(b2), sup(b2));
E = 1.1 * [0.135 * argMax2(1) 3.269 * argMax2(2); 0 0.711 * argMax2(2); 0.279 * argMax2(1) 0];
A1 = infsup(inf(A) + E, sup(A) - E);
[tolMax2, argMax2, ~, ~] = tolsolvty(inf(A1), sup(A1), inf(b2), sup(b2));
ive2 = ive(A1, b2);
rve2 = rve(A1, tolMax2);
iveBox2 = [midrad(argMax2(1), ive2); midrad(argMax2(2), ive2)];
rveBox2 = [midrad(argMax2(1), rve2); midrad(argMax2(2), rve2)];
A1
tolMax2
argMax2
ive2
rve2
drawContour(A1, b2, argMax2, "Correct matrix A");
plotintval([iveBox2, rveBox2], 'n');

% Tol maximum position due to the matrix as a whole
iterations = 10;
A2 = A;
figure
for i = 1 : iterations
    C = rad(A2)./2;
    A2 = infsup(inf(A2) + C, sup(A2) - C);
    [tolMax, argMax, ~, ~] = tolsolvty(inf(A2), sup(A2), inf(b), sup(b));
    %plot(argMax(1), argMax(2), '*b');
    plot(i, tolMax, '*b');
    hold on
    tolMax
    argMax
end
grid on
title("Tol value")

% Tol maximum position due to the matrix line by line
line1 = [1, 1; 0, 0; 0, 0];
line2 = [0, 0; 1, 1; 0, 0];
line3 = [0, 0; 0, 0; 1, 1];
drawTolMax(A, b, line1, iterations, "Tol maximum position by the first line")
drawTolMax(A, b, line2, iterations, "Tol maximum position by the second line")
drawTolMax(A, b, line3, iterations, "Tol maximum position by the third line")

