function [] = useRwid(history, name)
  x1 = history(1, :);
  x2 = history(2, :);
  list1 = [];
  list2 = [];
  for i = 1 : size(x1, 2) - 1
    rwid1 = rwid(x1(i), x1(i + 1));
    rwid2 = rwid(x2(i), x2(i + 1));
    list1 = [list1 rwid1];
    list2 = [list2 rwid2];
  endfor
  
  figure
  plot(list1);
  hold on
  plot(list2);
  xlabel('iterations')
  ylabel('rwid')
  legend('component x', 'component y')
  title(name)
endfunction