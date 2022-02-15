function [] = drawTolMax(A, b, line, iterations, name)
figure
drawContour(A, b)
for i = 1 : iterations
    C = rad(A)./2 .*line;
    A = infsup(inf(A) + C, sup(A) - C);
    [tolMax, argMax, ~, ~] = tolsolvty(inf(A), sup(A), inf(b), sup(b));

    plot3(argMax(1), argMax(2), tolMax,'*r'); 
    hold on    
end
grid on
title(name)
end