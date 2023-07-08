pkg load queueing;
clc;
clear all;
close all;

lambda = 5;
mu = 10;
states = [0, 1, 2, 3, 4];
initial_state = [1, 0, 0, 0, 0];

#i
births_B = [lambda, lambda/2, lambda/3, lambda/4];
deaths_D = [mu, mu, mu, mu];

transition_matrix = ctmcbd(births_B, deaths_D);
display(transition_matrix);

#ii
P = ctmc(transition_matrix);
display(P);
figure(1);
bar(states, P, "r", 0.5);

#iii
mean_value = P(2) + 2*P(3) + 3*P(4) + 4*P(5);
display(mean_value); 

#iv
P_blocking = P(5);
display(P_blocking);

#v
for i = 1:1:5 
  index = 0;
  for T = 0 : 0.01 : 50
    index = index + 1;
    P0 = ctmc(transition_matrix, T, initial_state);
    Prob0(index) = P0(i);
    if P0 - P < 0.01
      break;
    endif
  endfor

  T = 0 : 0.01 : T;
  figure(i+1);
  plot(T, Prob0, "r", "linewidth", 1.3);
  xlabel("Time");
  ylabel("Probability");
 endfor
 
 
 
 