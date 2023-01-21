import re
import pandas as pd
from os import path

def update_record():
# Receiving the name of file which the user wants to update.
    print("Please enter the name of file you want to update it")
    filename=input()
# Checking if the name of file is valid or not.
    while not path.exists(filename):
        print("the file is not exist, please write valid file name")
        filename = input()
# Reading the file and iterate to check the usrename which the user entered to update it.
    else:
# Setting initial value of the counter to zero
        rowcount = 0
# iterating through the whole file
        for row in open(filename):
            rowcount += 1
        if (rowcount == 1):
            print("There is no data in the file ! ")
        else:
            uf = pd.read_csv(filename)
            print("Please enter the username you want to update its data")
            username = input()
            row_number = ''
            for index, row in uf.iterrows():
                if row['Username'] == username:
                    row_number = index
                    print(row_number)
                    while(row_number == ''):
                         print("Error ! You entered invalid name")
                         print("Please enter the username you want to update his data")
                         username = input()
# Receiving the data which the user wants to update
                    else:
                        print("Which data do you want to change it? \n" )
                        print(" 1) Username \n 2) Email_Address \n 3) Phone_Nmber \n 4) Address \n 5)All_Record ")
                        choice=input()

                        while not (choice == '1' or choice == '2' or choice == '3' or choice == '4' or choice == '5'):
                              print("You entered invalid name")
                              print("Please enter Which data do you want to change it? 1 or 2 or 3 or 4 or 5")
                              choice = input()
                        else:
                            if(choice == '1'):
                                print("Please enter the new username ")
                                Username = input()
                                while not all(x.isalpha or x == "" for x in Username):
                                    print("Error !")
                                    print("Please enter valid name : ")
                                    Username = input()
                                else:
                                     uf.iloc[row_number, 0] = Username
                                     uf.to_csv(filename, index=False)
                                     print("Username updated successfully")
                            elif(choice == '2'):
                                   print("please, Enter the new email address ")
                                   Email_Address = input()
                                   regex = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'
                                   while not (re.search(regex, Email_Address)):
                                       print("Error !")
                                       print("Please enter valid email address: ")
                                       Email_Address = input()
                                   else:
                                       uf.iloc[row_number, 1] = Email_Address
                                       uf.to_csv(filename, index=False)
                                       print("Email_Address updated successfully")
                            elif(choice == '3'):
                                   print("please, Enter the new phone number ")
                                   Phone_Nmber = input()
                                   pattern = "^(00201|\+201|01)[0-2,5]{1}[0-9]{8}"
                                   while not re.match(pattern, Phone_Number):
                                       print("Error !")
                                       print("Please enter valid phone number : ")
                                       Phone_Number = input()
                                   else:
                                       uf.iloc[row_number, 2] = Phone_Nmber
                                       uf.to_csv(filename, index=False)
                                       print("Phone_Number updated successfully")
                            elif(choice == '4'):
                                   print("please, Enter the new address ")
                                   Address = input()
                                   uf.iloc[row_number, 3] = Address
                                   uf.to_csv(filename, index=False)
                                   print("Address updated successfully")
                            else:
                                 print("Please enter the new username ")
                                 Username = input()
                                 while not all(x.isalpha or x == "" for x in Username):
                                    print("Error !")
                                    print("Please enter valid name : ")
                                    Username = input()
                                 else:
                                      uf.iloc[row_number, 0] = Username
                                      uf.to_csv(filename, index=False)
                                      print("Username updated successfully \n")
                                      print("please, Enter the new email address ")
                                      Email_Address = input()
                                      regex = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'
                                      while not (re.search(regex, Email_Address)):
                                         print("Error !")
                                         print("Please enter valid email address: ")
                                         Email_Address = input()
                                      else:
                                          uf.iloc[row_number, 1] = Email_Address
                                          uf.to_csv(filename, index=False)
                                          print("Email_Address updated successfully \n")
                                          print("please, Enter the new phone number ")
                                          Phone_Nmber = input()
                                          pattern = "^(00201|\+201|01)[0-2,5]{1}[0-9]{8}"
                                          while not re.match(pattern, Phone_Number):
                                             print("Error !")
                                             print("Please enter valid phone number : ")
                                             Phone_Number = input()
                                          else:
                                              uf.iloc[row_number, 2] = Phone_Nmber
                                              uf.to_csv(filename, index=False)
                                              print("Phone_Number updated successfully")
                                              print("please, Enter the new address ")
                                              Address = input()
                                              uf.iloc[row_number, 3] = Address
                                              uf.to_csv(filename, index=False)
                                              print("Address updated successfully")