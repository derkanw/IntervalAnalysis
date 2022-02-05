function z = Bukin(x, y)
z = 100 * sqrt(abs(y - 0.01 * sqr(x))) + 0.01 * abs(x + 10);
end
