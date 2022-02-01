function [] = drawTolMax(A, b, line, iterations, name)
figure
for i = 1 : iterations
    C = rad(A)./2 .*line;
    A = infsup(inf(A) + C, sup(A) - C);
    [~, argMax, ~, ~] = tolsolvty(inf(A), sup(A), inf(b), sup(b));
    plot(argMax(1), argMax(2), '*r'); 
    hold on    
end
grid on
title(name)
end