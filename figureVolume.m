pkg load statistics;

function [res] = f(x)
  a = 9;
  res = log(a * x + 1);
endfunction

function calc_volume(n)
  c = 8.61;
  y = 0.95;
  k = 6;
  T = norminv((y + 1) / 2);  
  X = rand(k, n);
  F_x = sum(arrayfun(@f, X));
  V = mean(F_x <= c);
  d = T * sqrt(V * (1 - V) / n);
  printf("N = %d\n", n);
  printf("Volume is %g (from %g to %g)\n", V, V - d, V + d);
  printf("Delta is %g\n\n", d); 
endfunction

calc_volume(10000);
calc_volume(1000000);

