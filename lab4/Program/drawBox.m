function [] = plotBox(x, mode)
  plot([inf(x(1)), inf(x(1)), sup(x(1)), sup(x(1)), inf(x(1))], [inf(x(2)), sup(x(2)), sup(x(2)), inf(x(2)), inf(x(2))], mode)
  hold on
  plot(mid(x(1)), mid(x(2)))
  hold on
endfunction