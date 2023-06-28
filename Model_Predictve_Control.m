%Model Predictive Controller Programming Example 
%Quadratic Programming of a simple MPC controller

%Written by: Eric Yun 
%Date: 29/06/2023

x_0 = 0.0; %initial value of controlled variable 
r_0 = 1.0; %zeroth reference input
u_0 = 5.0; %initial control input 
w_xi = 0.5; %weighting coefficient of controlled variable
w_ui = 0.3; %weighting coefficient penalising relative big changes in control input 

H = 3; 
f = 2;
A = 1;
b = 6;

x_1 = quadprog(H,f,A,b); %controlled variable at time t + T 

T = 10.0 %discrete time step 
t_0 = 0; %initial time 
t_1 = t_0 + T; %final time 

x = [x_0, x_1];
t = [t_0, t_1]; 

plot(t,x)


%Comment: This is just for one discrete time step

