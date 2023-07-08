pkg load queueing;
clc;
clear all;
close all;

function fun = erlangb_factorial (r, c)
  sum = 0;
  for k = 0:1:c
    sum = sum + (power(r, k) / factorial(k));
  endfor
  fun = (power(r, c)/factorial(c)) / sum;
endfunction


function b = erlangb_iterative (r, c)
  b = 1;
  for i = 0:1:c
    b = (r * b) / ((r * b) + i);
  endfor
endfunction


P = zeros(0, 200)
for i = 1:1:200
  a = i * (23/60)
  P(i) = erlangb_iterative(a, i)
endfor

figure(1);
stem(P, 'r', "linewidth", 0.4);
xlabel("servers");
ylabel("P(blocking)");


  