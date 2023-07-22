%Mechanical behaviour of plastic deformation 

%A program that implements plastic deformation of a beam 

%Written By: Eric Yun
%Date: 23/07/2023 

sigma_0 = 276*10^6 %yield strength, Pa
E = 70*10^9 %elastic modulus, Pa 
t = 3*10^-3 %thickness, m 
M = 50000 %Nm 
c = 0.5 %the length of the cross section, m
n = 0.25 %strain hardening coefficient of aluminum, typically between 0.2-0.3
H = 806*10^6 %strength coefficient of aluminum, Pa

%Modelling equations (at x = 0)
sigma_max = (3*M)/(2*t*c^2)
plastic_strain_max = (sigma_max/H)^(1/n) %plastic component of maximum strain 
elastic_strain_max = (sigma_max/E) %elastic component of maximum strain
strain_max = plastic_strain_max + elastic_strain_max %maximum strain
strain_rc = (sigma_0/(2*E))*(-3 + 2*(E*strain_max)/sigma_0+((sigma_0)/(E*strain_max))^2)
l_rc = c*(strain_rc + 1) %residual length at x = 0 

residual_displacement = l_rc - c %residual displacement at x = 0

%To do: vary strain hardening coefficient and strength coefficient of
%aluminum to plot a range of residual displacement values for aluminum type
%materials 




