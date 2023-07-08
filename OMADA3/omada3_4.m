#2, ë = 1
clc;
clear all;
close all;
rand("seed", 1);

P = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
arrivals = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
total_arrivals = 0; % to measure the total number of arrivals
current_state = 0;  % holds the current state of the system
previous_mean_clients = 0; % will help in the convergence test
index = 0;

lambda = 1; 
mu = 1 * (current_state + 1); %initialize mu with current_state 0
threshold = lambda/(lambda + mu); % the threshold used to calculate probabilities

transitions = 0; % holds the transitions of the simulation in transitions steps

while transitions >= 0 
  transitions = transitions + 1; % one more transitions step
  
  if mod(transitions, 1000) == 0 % check for convergence every 1000 transitions steps
    index = index + 1;
    for i=1:1:length(arrivals)
        P(i) = arrivals(i)/total_arrivals; % calcuate the probability of every state in the system
    endfor
    
    mean_clients = 0; % calculate the mean number of clients in the system
    for i=1:1:length(arrivals)
       mean_clients = mean_clients + (i-1).*P(i);
    endfor
    
    to_plot(index) = mean_clients;
        
    if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 % convergence test
      break;
    endif
    
    previous_mean_clients = mean_clients;
    
  endif
  
  random_number = rand(1); % generate a random number (Uniform distribution)
  if current_state == 0 || random_number < threshold % arrival
    total_arrivals = total_arrivals + 1;
    arrivals(current_state + 1) = arrivals(current_state + 1) + 1;
    if current_state < 10 %increase current state only if less than 10
      current_state = current_state + 1;
    endif
  
  else % departure
    if current_state != 0
      current_state = current_state - 1;
    endif
  endif
  mu = 1 * (current_state + 1); %new value of m
  threshold = lambda/(lambda + mu); %new value of threshold
endwhile

display("Probabilities of each state:");
for i=1:1:length(arrivals)
  printf("P(%d) = %d\n", i-1, P(i));
endfor

printf("P(blocking) = %d\n", P(11));

throughput = lambda*(1-P(11)); 
average_delay_time = mean_clients / throughput; %Little
printf("Average delay time : %d\n", average_delay_time);

grid on;

figure(1);
plot(to_plot,"r","linewidth",1.3);
title("Average number of clients in the M/M/1/10 queue: Convergence for lambda = 1");
xlabel("transitions in thousands");
ylabel("Average number of clients");
grid on;

state = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
figure(2);
bar(state,P ,0.4);
title("Probabilities for lambda = 1")
grid on;
