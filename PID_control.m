%PID Control of a beam deflection

%A Simple program that implements control of beam deflection  at a certain point  
%Simulation is discrete 
%Beam is fixed by free end 

%Written By: Eric Yun
%Date: 12/07/2023

classdef PID_control
    %Initialisation
    properties
        %PID Controller
        r = -0.001 %m
        vA = 0 %m
        Kp = 3 %proportional gain
        Ki = 3 %integral gain
        Kd = 3 %derivative gain
        t_control = 100 %s, duration of controller operation
        t_increment = 0.01 %s, time increment of controller operation

        %Plant initialisation
        L = 5 %m
        E = 2000000 %Pa
        I = 3000 %kgm^2
        increment = 0.01 %m, simulation increment
    end
    
    methods
        function [output, e, t] = set_up(obj)
            e = zeros(1,(obj.t_control/obj.t_increment)+1);
            vA = zeros(1,(obj.t_control/obj.t_increment)+1);
            e(1,1) = [0]; %initial error
            t(1,1) = [0]; %s, time step
            output.vA(1,1) = [0]; %m,
            t(1,2) = t(1,1) + obj.t_increment;
            P = obj.Kp*e(1,1); %Proportional term
            I = obj.Ki*sum(e(1,1)); %Integral term
            D = obj.Kd*(e(1,1))/obj.t_increment; %Derivative term

            output.u = P+I+D; %Pa, control input

            output.vA(1,2) = -(output.u*obj.L^3)/(3*obj.E*obj.I);
        end
        
        function [vA, u, e, t] = closed_loop_control(obj,e,t)
            e = zeros(1,(obj.t_control/obj.t_increment)+1);
            u = zeros(1, (obj.t_control/obj.t_increment)+1);
            vA = zeros(1,(obj.t_control/obj.t_increment)+1);
            for i = 2:1:(obj.t_control/obj.t_increment)+1
                t(i+1) = t(i) + obj.t_increment;
                e(i+1) = obj.r - vA(1,i);
                P = obj.Kp*e(i); %Proportional term
                I = obj.Ki*sum(e); %Integral term
                D = obj.Kd*(e(i)-e(i-1))/obj.t_increment; %Derivative term

                u(i+1) = P+I+D; %Pa, control input

                vA(1,i+1) = -(u(i+1)*obj.L^3)/(3*obj.E*obj.I);
            end
            e;
            u;
            vA;
        end
        
        function control_plot(obj,vA, u, e, t)
            if size(t) == size(u) && size(t) == size(vA)
                figure(1);
                plot(t,vA)
                title('A plot of PID control of a beam deflection')
                xlabel('time (s)')
                ylabel('beam deflection (m)')

                figure(2);
                plot(t,u)
                title('A plot of PID control input')
                xlabel('time (s)')
                ylabel('control input (Pa)')

                figure(3);
                plot(t,e)
                title('A plot of PID control errors')
                xlabel('time (s)')
                ylabel('error')    
            else
                disp("Controller Terminated")
                return
            end
        end
    end
end

%Note: PID control takes a long time for a sizable deflection
%To do: PID controller above needs a stopping condition 

% %Implement 
% C = PID_control(); % create an instance of the PID_control class
% [output, e, t] = C.set_up(); % call the set_up function to initialize e and t
% [vA, u, e, t] = C.closed_loop_control(e,t); % call the closed_loop_control function with e and t as input arguments
% C.control_plot(vA, u, e, t); % call the control_plot function to plot the results



    