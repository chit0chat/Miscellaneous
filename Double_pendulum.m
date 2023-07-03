%Chaotic Double Pendulum 

%Program Description: A chaotic double pendulum simulation 
%                     with two simple rigid rods that do not vary in length
%                     or mass 

%Written By: Eric Yun 
%Date: 04/07/2023


%Intial Conditions 

m = 3 %kg 
l = 2 %m 
theta_1 = 0 %rad 
theta_2 = 0 %rad 
x_1 = 0 %m, position of the first centre of mass in the horizontal direction
x_2 = 0 %m, position of the second centre of mass in the horizontal direction
y_1 = 1 %m, position of the first centre of mass in the vertical direction
y_2 = 3 %m, position of the second centre of mass in the vertical direction
theta_1_dot = 2   %rad/s, The simulation is not for engineering purposes 
theta_2_dot = 3   %rad/s, The simulation is not for engineering purposes 
time_step = 0.1 %s

%Modelling Equations 

%x_1_t = 0.5*l*sin(theta_1)
%y_1_t = -0.5*l*cos(theta_1) 
%x_2_t = l*(sin(theta_1) + 0.5*sin(theta_2))
%y_2_t = -l*(cos(theta_1) + 0.5*cos(theta_2))

%Modelling Equations 2 (Coupled System) 

%p_theta_1 = (1/6)*m*(l^2)*(8*theta_1_dot + 3*theta_2_dot*cos(theta_1-theta_2))
%p_theta_2 = (1/6)*m*(l^2)*(2*theta_2_dot + 3*theta_1_dot*cos(theta_1-theta_2))

%theta_1_dot = (6/(m*(l^2)))*(2*p_theta_1 - 3*cos(theta_1 - theta_2)*p_theta_2)/(16 - 9*cos(theta_1 - theta_2)^2)
%theta_2_dot = (6/(m*(l^2)))*(8*p_theta_2 - 3*cos(theta_1 - theta_2)*p_theta_1)/(16 - 9*cos(theta_1 - theta_2)^2)

%Modelling Equations 3 (Angular Displacements) 

%delta_theta_1 = theta_1_dot*time_step 
%delta_theta_2 = theta_2_dot*time_step 

%new_theta_1 = theta_1 + delta_theta_1 
%new_theta_2 = theta_2 + delta_theta_2 

%Compile (one time step)

x_1_t_array = [x_1]; 
x_2_t_array = [x_2];
y_1_t_array = [y_1];
y_2_t_array = [y_2];
new_theta_1 = theta_1;
new_theta_2 = theta_2;

for t = 0:time_step:10 
    x_1_t_array = [x_1_t_array, 0.5*l*sin(new_theta_1)]
    y_1_t_array = [y_1_t_array, -0.5*l*cos(new_theta_1)] 
    x_2_t_array = [x_2_t_array, l*(sin(new_theta_1) + 0.5*sin(new_theta_2))]
    y_2_t_array = [y_2_t_array, -l*(cos(new_theta_1) + 0.5*cos(new_theta_2))]
    p_theta_1 = (1/6)*m*(l^2)*(8*theta_1_dot + 3*theta_2_dot*cos(new_theta_1-new_theta_2));
    p_theta_2 = (1/6)*m*(l^2)*(2*theta_2_dot + 3*theta_1_dot*cos(new_theta_1-new_theta_2));
    theta_1_dot = (6/(m*(l^2)))*(2*p_theta_1 - 3*cos(new_theta_1 - new_theta_2)*p_theta_2)/(16 - 9*cos(new_theta_1 - new_theta_2)^2);
    theta_2_dot = (6/(m*(l^2)))*(8*p_theta_2 - 3*cos(new_theta_1 - new_theta_2)*p_theta_1)/(16 - 9*cos(new_theta_1 - new_theta_2)^2);
    delta_theta_1 = theta_1_dot*time_step;
    delta_theta_2 = theta_2_dot*time_step; 
    new_theta_1 = new_theta_1 + delta_theta_1;
    new_theta_2 = new_theta_2 + delta_theta_2;
end 

x_1_t_array = x_1_t_array(2:end);
x_2_t_array = x_2_t_array(2:end);
y_1_t_array = y_1_t_array(2:end);
y_2_t_array = y_2_t_array(2:end);
t = 0:time_step:10;

figure(1);
plot(t, x_1_t_array);
title('A plot of x1 (m) versus time (s) in a dynamically coupled double pendulum system')
xlabel('t (s)')
ylabel('x1 (m)') 

figure(2);
plot(t, x_2_t_array);
title('A plot of x2 (m) versus time (s) in a dynamically coupled double pendulum system')
xlabel('t (s)')
ylabel('x2 (m)') 

figure(3);
plot(t, y_1_t_array);
title('A plot of y1 (m) versus time (s) in a dynamically coupled double pendulum system')
xlabel('t (s)')
ylabel('y1 (m)')

figure(4);
plot(t, y_2_t_array);
title('A plot of y2 (m) versus time (s) in a dynamically coupled double pendulum system')
xlabel('t (s)')
ylabel('y2 (m)')


%To do: Embedded Graphics of the simulation 