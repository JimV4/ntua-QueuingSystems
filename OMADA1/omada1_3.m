clc;
clear all;
close all;
pkg load statistics;

#A
x = exprnd(0.2, 1, 100);
y = ones(100,1);
for i=1:99
   x(i+1) = x(i+1) + x(i);
   y(i+1) = y(i+1) + y(i);
endfor

figure(1);
stairs(x, y, color = 'r');
xlabel("Seconds");
ylabel("N(t)");


#B
#i N = 200
x = exprnd(0.2, 1, 200);
y = ones(200, 1);
for i=1:199
   x(i+1) = x(i+1) + x(i);
   y(i+1) = y(i+1) + y(i);
endfor

figure(2);
stairs(x, y, color = 'r');
xlabel("Seconds");
ylabel("N(t)");
display("ë = ");
display(200/x(200));


#ii N = 300
x = exprnd(0.2, 1, 300);
y = ones(300, 1);
for i=1:299
   x(i+1) = x(i+1) + x(i);
   y(i+1) = y(i+1) + y(i);
endfor

figure(3);
stairs(x, y, color = 'r');
xlabel("Seconds");
ylabel("N(t)");
display("ë = ");
display(300/x(300));


#iii N = 500
x = exprnd(0.2, 1, 500);
y = ones(500, 1);
for i=1:499
   x(i+1) = x(i+1) + x(i);
   y(i+1) = y(i+1) + y(i);
endfor

figure(4);
stairs(x, y, color = 'r');
xlabel("Seconds");
ylabel("N(t)");
display("ë = ");
display(500/x(500));


#iv N = 1000
x = exprnd(0.2, 1, 1000);
y = ones(1000, 1);
for i=1:999
   x(i+1) = x(i+1) + x(i);
   y(i+1) = y(i+1) + y(i);
endfor

figure(5);
stairs(x, y, color = 'r');
xlabel("Seconds");
ylabel("N(t)");
display("ë = ");
display(1000/x(1000));


#v N = 10000
x = exprnd(0.2, 1, 10000);
y = ones(10000, 1);
for i=1:9999
   x(i+1) = x(i+1) + x(i);
   y(i+1) = y(i+1) + y(i);
endfor

figure(6);
stairs(x, y, color = 'r');
xlabel("Seconds");
ylabel("N(t)");
display("ë = ");
display(10000/x(10000));


