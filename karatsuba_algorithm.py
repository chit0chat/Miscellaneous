def karatsuba(B, m, x, y):
    
    n = len(str(x))
    
    if (m >= n):
        print("m not less than n")
        return 0 
    
    x_1 = x//(B**m)
    x_0 = x - x_1*(B**m)
    y_1 = y//(B**m)
    y_0 = y - y_1*(B**m) 
    
    z_2 = x_1*y_1
    z_1 = x_1*y_0 + x_0*y_1
    z_0 = x_0*y_0
    print("z_2: ", z_2)
    print("z_1: ", z_1)
    print("z_0: ", z_0)
    
    product = z_2*(B**(2*m)) + z_1*B**m + z_0
    
    return product 

x = 3141592653589793238462643383279502884197169399375105820974944592
y = 2718281828459045235360287471352662497757247093699959574966967627

B = 10
m = 3

xy = karatsuba(B, m, x, y)
print(xy)

check = x*y 
print(check) 

if check == xy:
    print("Correct")
else:
    print("Incorrect") 