function [] = neutonBox(history, xi, name)
  figure
  x = history(:, 1);
  drawBox(x, 'b')
  for i = 2 : size(history, 2) - 1
    x = history(:, i);
    drawBox(x, 'k-')
  endfor
  i = size(history, 2);
  i
  x = history(:, i);
  drawBox(x, 'r')
  plot(xi(1, :), xi(2, :), '--') 
  title(name)
endfunction