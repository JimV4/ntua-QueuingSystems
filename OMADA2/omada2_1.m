pkg load queueing;
clc;
clear all;
close all;


lambda = 5;
mu = 5.001 : 0.001 : 10;
[U, R, Q, X, p0] = qsmm1 (lambda, mu);

#1
figure(1);
hold on;
plot(mu, U, color = 'b', 'linewidth', 1.2);
hold off;

xlabel("Service rate(ì)");
ylabel("Utilization (u)");

#2
figure(2);
hold on;
plot(mu, R, color = 'b', 'linewidth', 1.2);
hold off;

xlabel("Service rate(ì)");
ylabel("Average response time Å(Ô)");

#3
figure(3);
hold on;
plot(mu, Q, color = 'b', 'linewidth', 1.2);
hold off;

xlabel("Service rate (ì)");
ylabel("Average number of requests Å[(n(t)]");

#4
figure(4);
hold on;
plot(mu, X, color = 'b', 'linewidth', 1.2);
hold off;

xlabel("Service rate (ì)");
ylabel("Throughput (ã)");


