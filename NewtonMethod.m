clc;clear all;
x=0.5;                                         %set starting value 
nmax=25;                                       %set max number of iterations 
eps=1;                                         %initialize error bound eps 
xvals=x;                                       %initialize array of iterates 
n=0;                                           %initialize n (counts iterations) 

while eps>=1e-5 & n<=nmax                        %set while-conditions 
    y=x-(sin(x)+x*cos(x))/(2*cos(x)-x*sin(x)); %compute next iterate 
    xvals=[xvals;y];                           %write next iterate in array 
    eps=abs(y-x);                              %compute error 
    x=y;n=n+1;                                 %update x and n 
end                                            %end of while-loop 
x
