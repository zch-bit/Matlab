%   Forward-time and backward space scheme, with lambda=0.8
clear all;
clc;
format short
h=[1/10, 1/20, 1/40];
lambda=0.8;
k=lambda.*h;
XC=(3-(-1))./h+1        %length of x when h=1/10,1/20,1/40 respectively.
TC=round((2.4)./k+1)    %length of t when h=1/10,1/20,1/40 respectively.

%innitialize x and u(m,n)
x1(1:XC(1))=[-1:0.1:3];    %h1=1/10
x2(1:XC(2))=[-1:0.05:3];   %h2=1/20
x3(1:XC(3))=[-1:0.025:3];  %h3=1/40

u1(1:TC(1),1:XC(1))=0;	
u2(1:TC(2),1:XC(2))=0;
u3(1:TC(3),1:XC(3))=0;

% innitial boundary value when |x|<=1/2.
for i=6:16
    u1(XC(1),i)=cos(pi.*x1(i)).^2;
end

for k=11:31
    u2(XC(2),k)=cos(pi.*x2(k)).^2;
end

for j=21:61
    u3(XC(3),j)=cos(pi.*x3(j)).^2;
end

for k=30:-1:1
    for j=2:41
        u1(k,j)=.2*u1(k+1,j)+0.8*u1(k+1,j-1)
    end
end


m1=max(max(u1))
m2=max(max(u2))
m3=max(max(u3))

subplot(2,3,1)
plot(x1,u1(1,:))
ylabel('Time')
xlabel('space')
title('Forward-time and backward space scheme, with h=1/10')
legend('u(0,x)',2)
subplot(2,3,2)
surf(u1)
ylabel('Time')
xlabel('space')
hold off
