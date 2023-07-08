#1
clc;
clear all;
close all;

P = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
arrivals = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
mean_clients = 0;
total_arrivals = 0; % to measure the total number of arrivals
current_state = 0;  % holds the current state of the system
previous_mean_clients = 0; % will help in the convergence test
index = 0;

lambda = 5; 
mu = 5;
threshold = lambda/(lambda + mu); % the threshold used to calculate probabilities

transitions = 0; % holds the transitions of the simulation in transitions steps
while transitions >= 0 && transitions < 31
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
    if current_state < 11
      printf("Transition %d:\n", transitions);
      printf("Current system state : %d\n", current_state);
      printf("Next transition : arrival\n");
      arrivals(current_state + 1) = arrivals(current_state + 1) + 1;
      printf("Total number of arrivals in current state : %d\n\n", arrivals(current_state + 1));
    endif
    if current_state < 10 %increase current state only if less than 10
      current_state = current_state + 1;
    endif
  
  else % departure
    if current_state != 0
      printf("Transition %d:\n", transitions);
      printf("Current system state : %d\n", current_state);
      printf("Next transition : departure\n");
      printf("Total number of arrivals in current state : %d\n\n", arrivals(current_state + 1));
    endif
    current_state = current_state - 1;
  endif
endwhile

