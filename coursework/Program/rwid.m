function [result] = rwid(x, y)
  epsilon = 1e-15;
  d = max(sup(x), sup(y)) - min(inf(x), inf(y));
  if d < epsilon
    result = 0;
  else
    result = (min(sup(x), sup(y))- max(inf(x), inf(y))) / d;
  endif
  if result < epsilon
    result = 0;
  endif
endfunction