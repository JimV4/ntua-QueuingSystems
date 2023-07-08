pkg load queueing;
clc;
clear all;

a = 0.001:0.001:0.999;
l = 10000;
l1 = a*l;
l2 = (1-a)*l;
m1 = 14650;
m2 = 11720;

[U1, R1, Q1, X1, p1] = qsmm1(l1, m1);
[U2, R2, Q2, X2, p2] = qsmm1(l2, m2);

averageNumberOfClients = Q1 + Q2;
averageWaitTime = averageNumberOfClients / l;

figure(1);
plot(a, averageWaitTime, "r", "linewidth", 2);
xlabel("value of a");
ylabel("Average Waiting Time");

minimumTime = min(averageWaitTime);
display(minimumTime);

mina = find(averageWaitTime == minimumTime);
display(mina*0.001);



