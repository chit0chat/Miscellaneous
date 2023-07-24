%Laminar Flow in a pipe

%A program that simulates laminar flow in a pipe 

%Written By: Eric Yun
%Date: 24/07/2023

%Initialised parameters 
D = 3.0; %diameter of the pipe, m
u_0 = 0.1; %velocity of the fluid at y = 0, ms^-1
delta_t = 0.001;
r = [0.25, 0.15, 0.05, 0, -0.05, -0.15, -0.25];
t = zeros(length(r), 1/delta_t);

for i = 1:1:length(r)
    t(i,:) = linspace(0, 10, 1/delta_t);
end

%Initialise x array 
x = zeros(length(r), length(t))

%Calculate velocity profile
for i = 1:1:length(r)
    u(i) = u_0*(1 - (4*r(i)^2)/(D^2));
end

%Calculate displacement over time 
for i = 1:1:length(r) 
    for ii = 1:1:length(t) 
        delta_x = u(i)*delta_t
        x(i, ii+1) = x(i, ii) + delta_x;
    end
end

%Plot displacement of fluid in the pipe 
figure(1);
plot(t,x(:,1:length(x)-1))
title('Simulation of fluid movement in a pipe over time')
xlabel('time in seconds (s)')
ylabel('displacement over time (m)')

%Plot velocity profile of fluid in the pipe
figure(2);
plot(u, r);
title('Simulation of velocity profile in a pipe')
xlabel('velocity of fluid in meters per second (ms^-1)')
ylabel('radial displacement from the center of the cross section (m)')
