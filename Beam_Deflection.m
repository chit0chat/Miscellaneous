%Beam Deflection Example 

%A simple program that simulates beam deflection of a 
%cantilever beam with a free end 

%Written By: Eric Yun
%Date:12/07/2023

%Note: Formulae are provided by a course textbook for 
%a mechanical engineering course at University of Canterbury 

%Initialisation 

P = 100000 %Pa 
L = 5 %m 
E = 2000000 %Pa
I = 3000 %kgm^2
increment = 0.01 %m, simulation increment 

x = [5] %Displacement from the free end 
v = [((P/(6*E*I)))*(-x(1)^3+3*L^2*x(1)-2*L^3)] %Deflection at the free end 
enumeration = L/increment %Sets the limit of recursion 

%Elastic Curve Equation 

for i = 1:1:enumeration 
    x(i+1) = x(i) - increment 
end  

for i = 1:1:enumeration 
    v(i+1) = (P/(6*E*I))*(-x(i+1)^3+x(i+1)*3*L^2-2*L^3)
end

plot(x(end:-1:1), v)
title('Beam Deflection of a free end beam')
xlabel("Displacement from the free end (m)")
ylabel("Deflection from the initial elastic curve")