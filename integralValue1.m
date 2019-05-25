pkg load statistics;

function res = g(x)
  res = (x - 2) ^ 3;
endfunction

function res = g1(x)
  res = g(x) * sqrt(2 * pi * 1.5);
endfunction

function res = f(x)
  res = g(x) * exp(-((x - 1) ^ 2) / 3);
endfunction

function calc_value(n)
  mu = 1;
  sigma = sqrt(1.5);
  y = 0.95;
  T = norminv((y + 1) / 2);
  X = normrnd(mu, sigma, 1, n);
  F_x = arrayfun(@g1, X);
  V = mean(F_x);
  d = (std(F_x) * T) / sqrt(n);
  printf("N = %d\n", n);
  printf("Value is %g (from %g to %g)\n", V, V - d, V + d);
  printf("Delta is %g\n\n", d); 
endfunction

printf("Sample answer = %g\n\n", quad(@f, -inf, inf));
calc_value(10000);
calc_value(1000000);
