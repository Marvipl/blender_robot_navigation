clc, close all, clear
syms x(w) y(w) %wx wy cxy
wx=0.120;
wy=0.150;
cxy=0.135;

A = [wx^2 cxy; cxy wy^2];
B = [1; w];
Y = [x; y];

dY=diff(Y);

odes = diff(dY) == A*Y

[xSol(w), ySol(w)] = dsolve(odes)
xSol(w) = simplify(xSol(w))
ySol(w) = simplify(ySol(w))

dY=diff(Y);

C = Y(0) == [2; -1];
D = dY(0) == [1; 0];
Cond=[C,D];
[xSol(w), ySol(w)] = dsolve(odes,Cond)

xSol(w) = simplify(xSol(w))
ySol(w) = simplify(ySol(w))


t=0:.1:2*pi;
w=sin(t);
plot(xSol(w),ySol(w))

%axis([0 2*pi -1 1])