function [alpha, beta]= lsfitting(t,d)
t = transpose(t);
d = transpose(d);
nt = length(t);
A = zeros(nt,2);
for i=1:nt
    A(i,1)=t(i);
    A(i,2)=t(i)^2*exp(-0.1*t(i));
end
F = transpose(A)*A;
C = transpose(A)*d;
x = F(1,1)/F(2,1);
F(2,1) = F(2,1)*x;
F(2,2) = F(2,2)*x;
C(2)= C(2)*x;
beta = (C(2) - C(1))/(F(2,2)-F(1,1));
alpha = (C(1) - beta * F(1,2))/F(1,1);
disp("Beta: ");
disp(beta);
disp("Alpha:");
disp(alpha);
a = zeros(1,6);    
for i=1:nt
   a(i)=t(i)*alpha + beta*t(i)^2*exp(-0.1*t(i));
end
scatter(t,d);
hold on
plot(t,a);
hold off
end