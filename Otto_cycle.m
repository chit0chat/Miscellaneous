%Modelling an Otto Cycle Engine 

%Written By: Eric Yun 
%Date: 04/07/2023 

gamma_oxygen = 1.395 %Specific heat ratio (300K)
V1 = 3 %Initialised volume before compression (m^3) 
V2 = 1.3 %Compressed volume (m^3) 
T1 = 320 %Initialised temperature (K)
P1 = 100 %Initialised pressure (kPa)
r = V1/V2 %Compression ratio 
time_step = 0.1 %s 
C_p = 7.03 %Specific heat at constant pressure (cal/mol*C) 
S_std = 205 %Standard molar entropy of oxygen (J/(mol*K))
R = 8.314 %J/(mol*K)

% Calculate the initial entropy 
S1 = C_p*log(T1/298) - R*log(P1/101.325)

% %Modelling Equations (1-2) 
% T2 = T1*(V1/V2)^(gamma_oxygen-1) %Assuming isentropic process
% P2 = (P1*V1)/V2
% S2 = S1 + C_p*log(T2/T1) - R*log(P2/P1)
% 
% %Modelling Equations (2-3)
% V3 = V2 %Volume remains the same 
% T3 = T2*(V2/V3)^(gamma_oxygen-1) %Assuming isentropicity 
% P3 = (P2*V2/T2)*(T3/V3) %Assuming ideal gas 
% 
% %Modelling Equations (3-4) 
% V4 = V1 %Volume is the same as the initial volume 
% T4 = T3*(V3/V4)^(gamma_oxygen-1) %Assuming isentropicity 
% P4 = (P3*V3/T3)*(T4/V4) %Assuming ideal gas 

% %Pseudocode for Phase 1-2
% for t = 0:time_step:10
%    V(t_n+1) = V1(t_n)/r
%    T(t_n+1) = T(t_n)*(V(t_n)/V(t_n+1))^(gamma_oxygen-1)
%    P(t_n+1) = P(t_n)*V(t_n)/(V(t_n+1))
% end 

% Create Arrays for T, V, P and S
T = [] %K
V = [] %m^3
P = [] %kPa 
S = [] %J/(mol*K)

% Initialise Arrays 
T(1) = T1;
V(1) = V1; 
P(1) = P1; 
S(1) = S1;

% Simulation Phase 1-2 (V) Regression Modelling 
t1 = 0.1 %s
t2 = 10.1 %s
V_gradient = (V2 - V1)/(t2 - t1)

% Initialise n_step 
n_step = 1

% Simulate Phase 1-2 (V) 
for t = t1:time_step:t2
    t
    V(n_step+1) = V(n_step) + V_gradient*(time_step)
    n_step = n_step + 1 
end 

% V = V(1:end-1) %Taking out the last element which is unnecessary 

% Initialise n_step
n_step = 1

% Simulate Phase 1-2 (T and P) 
for t = t1:time_step:t2
    t
    T(n_step+1) = T(n_step)*(V(n_step)/V(n_step+1))^(gamma_oxygen-1)
    P(n_step+1) = P(n_step)*(V(n_step)/V(n_step+1)) 
    n_step = n_step + 1
end 

% Initialise n_step
n_step = 1

% Simulate Phase 1-2 (S)
for t = t1:time_step:t2
    t
    S(n_step+1) = S(n_step) 
    n_step = n_step + 1
end 

V1_2 = V(1:end-1)
P1_2 = P(1:end-1)
T1_2 = T(1:end-1)
S1_2 = S(1:end-1)

figure(1);
plot(V1_2,P1_2)
title("P-V diagram of an Otto Cycle Phase 1-2")
xlabel("Volume (m^3)")
ylabel("Pressure (kPa)")

figure(2);
plot(S1_2,T1_2)
title("T-S diagram of an Otto Cycle Phase 1-2")
xlabel("Entropy (J/(mol*K))")
ylabel("Temperature (kPa)")

%To do: Phase 2-3, 3-4 and 4-1 
