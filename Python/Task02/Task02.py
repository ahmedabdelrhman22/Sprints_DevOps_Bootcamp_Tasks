# This function is specify if the year is leap or not.
'''
1- I made a function to take the year from user.
2- Then the function is supposed the year is not leap.
3- After checking the year if it is leap or not using conditions, it returns true of false.
'''



def is_leap(year):
    leap=False
    if (year%400 == 0) or (year%4 == 0 and year%100 != 0):
        return True
    else:
        return False
'''
1- receiving input from the user to set it in the function.
2- calling the function and set it in new boolean to return it.
3- printing the result.
'''

if __name__ == '__main__':
    print("Please enter the year")
    y = input()
    x = is_leap(int(y))
    print(x)
    
'''
1- Sample input is "1800" ,
sample output is "False"
2- Sample input is "2500" ,
sample output is "False"
3- Sample input is "2000" ,
sample output is "True"
'''
