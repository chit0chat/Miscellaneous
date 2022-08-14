from matplotlib import pyplot as plt
import numpy as np

#Control System Feedback Loop (Functional Paradigm) 

#############################################################################
################# Gihoon Eric Yun ###########################################
#############################################################################

#Define variables 
Maximum_traumatic_fatigue = 1*10**6 #measured in Pa 
number_of_times_taken = 0 #measures number of times it takes for the subject to explode under pressure /// i.e number of feedback occurrences 
transfer_input = int(input("Type in the value of traumatic input\n")) #assumed constant, measured in Pa 
transfer_output = 0
transfer_function = 0
independent_variable = [] #for graphing purposes
dependent_variable = [] #for graphing purposes 

while transfer_output < Maximum_traumatic_fatigue: 
    
    transfer_function = 4*transfer_input #time domain 
    
    transfer_output = transfer_function 
    
    print(transfer_output)
    
    #Feedback 
    
    feedback = transfer_output #assumed positive 
    
    transfer_input += feedback #positive reinforcement 

    number_of_times_taken += 1 
    
    independent_variable.append(number_of_times_taken) 
    dependent_variable.append(transfer_output) 
    
transfer_input = 0 #initialises the defined variables as they 'disapper' after the collapse 
transfer_output = 0 
transfer_function = 0 
    
print("The number of times for the controlled explosion is: ", number_of_times_taken) 

independent_array = np.array(independent_variable)
dependent_array = np.array(dependent_variable) 

plt.title("A linear closed-system feedback model of traumatic fatigue")
plt.xlabel("Number of feedback occurrences")
plt.ylabel("Traumatic pressure (Pa)")
plt.plot(independent_array, dependent_array)
plt.axhline(y=1*10**6, linestyle='dashed', color='black')
plt.show()