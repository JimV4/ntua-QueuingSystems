clc;
clear all;
close all;
pkg load statistics;

#A: Probability Density Function of exponential distributions

k = 0:0.0001:8;
lambda = [0.5, 1, 3];

for i = 1 : columns(lambda)
  exp(i, :) = exppdf(k, lambda(i));
endfor 

colors = "rbk";
figure(1);
hold on;

for i = 1 : columns(lambda)
  plot(k, exp(i, :), colors(i), "linewidth", 1.2);
endfor
hold off;

title("Probability Density Function of exponential distribution");
xlabel("k values");
ylabel("f(x)");
legend("lambda=0.5", "lambda=1", "lambda=3");

#Â: Cumulative Distribution Function of exponential distributions
for i = 1 : columns(lambda)
  exp(i, :) = expcdf(k, lambda(i));
endfor

colors = "rbk";
figure(2);
hold on;

for i = 1 : columns(lambda)
  plot(k, exp(i, :), colors(i), "linewidth", 1.2);
endfor
hold off;

title("Probability Cumulative Function of exponential distribution");
xlabel("k values");
ylabel("F(x)");
legend("lambda=0.5", "lambda=1", "lambda=3");

#Ã: Lack of memory
k = 0:0.00001:8;
F = expcdf(k, 2.5);
first = 1 - F(30000);
second = (1 - F(50000)) ./ (1 - F(20000));
display("P(X > 30000) = ");
display(first);

display("P(X > 50000 | X > 20000) = ");
display(second);


