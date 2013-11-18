function p=bisection(a,b,N,TOL)
syms x;
%TOL=tolorance
flag=0;
i=1;%innitial i and flag
FA=a^3+4*a^2-10; %polynomial

grid on;
x=a:0.05:b;
plot(x,x.^3+4*x.^2-10,'b-o')
hold on;

while i<N
    p=(a+b)/2;
    FP=p^3+4*p^2-10;
    if FP==0 || (b-a)<TOL;
        flag=1;
    end
    
    if flag==1
        break;
    end
    
    if FA*FP>0
        a=p;
        FA=FP;
    else
        b=p;
    end 
   
   i=i+1;
   
end %end_while 

if flag==1
    p
    i
    plot(p,FP,'r*');
    text(p,FP-2,'This is the finanl point');
else
    error('Method fails after 1000 iteration')
end
grid on;

