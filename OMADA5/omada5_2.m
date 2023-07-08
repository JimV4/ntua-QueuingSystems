pkg load queueing
clc;
clear all;

#2
function [erg, r1, r2, r3, r4, r5] = intensities (l1, l2, m1, m2, m3, m4, m5)
  r1 = (l1/m1);
  r2 = (l2 + (2/7)*l1) / m2;
  r3 = ((4/7)*l1) / m3;
  r4 = ((3/7)*l1) / m4;
  r5 = ((4/7)*l1 + l2) / m5;
  printf("r1 = %d\n", r1);
  printf("r2 = %d\n", r2);
  printf("r3 = %d\n", r3);
  printf("r4 = %d\n", r4);
  printf("r5 = %d\n", r5);

  if r1<1 && r2<1 && r2<1 && r4<1 && r5<1
    erg = 1;
  else
    erg = 0;
  endif
  intensities = erg;
endfunction
  
#3
function [meanQ1, meanQ2, meanQ3, meanQ4, meanQ5] = mean_clients (l1, l2, m1, m2, m3, m4, m5)
  [erg, r1, r2, r3, r4, r5] = intensities(l1, l2, m1, m2, m3, m4, m5)
  meanQ1 = r1/(1-r1);
  meanQ2 = r2/(1-r2);
  meanQ3 = r3/(1-r3);
  meanQ4 = r4/(1-r4);
  meanQ5 = r5/(1-r5);
endfunction


#4
l1 = 4;
l2 = 1;
m1 = 6;
m2 = 5;
m3 = 8;
m4 = 7;
m5 = 6;
[erg, r1, r2, r3, r4, r5] = intensities(l1, l2, m1, m2, m3, m4, m5);

[meanQ1, meanQ2, meanQ3, meanQ4, meanQ5] = mean_clients(l1, l2, m1, m2, m3, m4, m5);
meanTime = (meanQ1 + meanQ2 + meanQ3 + meanQ4 + meanQ5) / (l1 + l2);
printf("E(T) = %d\n", meanTime);


#6

  

