pkg load statistics;

function res = f(x)
  res = sqrt(1 + x) * cos(x);
endfunction

function calc_value(n)
  a = -1;
  b = 2;
  y = 0.95;
  T = norminv((y + 1) / 2);
  X = unifrnd(a, b, 1, n);
  F_x = arrayfun(@f, X) * (b - a);
  V = mean(F_x);
  d = (std(F_x) * T) / sqrt(n);
  printf("Value is %g (from %g to %g)\n", V, V - d, V + d);
  printf("Delta is %g\n\n", d); 
endfunction

printf("Sample answer = %g\n\n", quad(@f, -1, 2));
calc_value(10000);
calc_value(1000000);
