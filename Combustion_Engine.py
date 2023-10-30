import math 

#A program that models the combustion engine using Gibbs Free Energy 
#Written By: Gihoon Yun 

#Inputs 
p_limit = 2*10**6 #Pa
n = 1 #number of mole of air 
C_v = 717 #J/(kg.K), heat capacity at constant volume of air 
T_limit = 1643 #K
T_init = 298 #K, initial temperature 
p = 10*10**5 #Pa, initial atmospheric pressure 
T = 298 #K, initial temperature
m = 0.02897 #kg, one mole of air 
C_p = 8.314 #J/(mol.K), heat capacity of air at constant pressure 
V = 0.001 #m^3, volume of combustion engine 
S = 0 #J/K, intial entropy (completely reverisible at this state) 

#Calculate initial internal energy 
U = n*C_v*T_init 

#Gibbs Free Energy Equation 

#H = U + p*V  
#G = H - T*S #G represents Gibbs free energy, H represents enthalpy and S represents entropy 
#G = U + p*V -T*S 

#Entropy Equation 
#delta_S = m*C_p*ln(T_2/T_1) 
#S_2 = m*C_p*ln(T_2) by product rule 

#Calculate Gibbs Free Energy 
G = U + p*V - T*S 

#First: pressure goes to limit  
p = p_limit

#Second: as pressure goes to limit, temperature increases 
T = T_limit 

#Thrid: as temperature increases, internal energy increases along with entropy to decrease volume
U = m*C_p*T  
S = m*C_p*math.log(T)
V = (G - U + T*S)/p

#And then: once volume is finished, an explosion occurs which increases volume back again and the cycle continues 
#This cycle will continue until entropy uses up Gibbs Free Energy 

#Print the values of pressure, volume, temperature, entropy and internal energy before the explosion 
print("The pressure before the explosion is", p) 
print("The volume before the explosion is", V) 
print("The temperature before the explosion is", T)
print("The entropy before the explosion is", S)
print("The internal energy before the explosion is", U) 

#Note: Volume before the explosion is higher than the initial volume 
#The engine is too weak to withstand the high temperature 

