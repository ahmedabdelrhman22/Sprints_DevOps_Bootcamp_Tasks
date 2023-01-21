import re
import time
from update_record_fun import update_record
from delete_record_fun import delete_record
from view_data_fun import view_data
from write_data_fun  import  write_data
Record= []
def get_data():
# Getting the datetime format using time library.
    Date = time.strftime('%Y-%m-%d %H:%M:%S')
# Receiving the action which the user wants to do.
    print(" 1) Create new record \n 2) Update your old record \n 3) Delete your old record \n 4) View your old record \n 5) Exit \n Please enter your choice number :  ")
    choice=input()
# Checking choice errors.
    while not (choice == "1" or choice == "2" or choice == "3" or choice == "4" or choice == "5"):
        print("Error !")
        print("Please enter valid choice")
        choice = input()
    else:
# If the user insert "1" to create new record we will receive 4 attributes from him to insert them in the .csv file.
        if(choice == "1"):
            print("Please enter the name : ")
            Username =input()
#Chcking the name if it is valid or not.
            while not all(x.isalpha or x == "" for x in Username):
                print("Error !")
                print("Please enter valid name : ")
                Username = input()
            else:
                 print("Please enter the email address : ")
                 Email_Address = input()
                 regex = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'
# Chcking the email address if it is valid or not.
                 while not (re.search(regex, Email_Address)):
                     print("Error !")
                     print("Please enter valid email address : ")
                     Email_Address = input()
                 else:
                     print("Please enter your phone numbers with space between each number : ")
                     Phone_Number = input()
                     print("\n")
                     user_list = Phone_Number.split()
                     pattern = "^(00201|\+201|01)[0-2,5]{1}[0-9]{8}"
# Chcking the phone number if it is valid or not.
                     while not re.match(pattern,Phone_Number):
                         print("Error !")
                         print("Please enter valid phone number : ")
                         Phone_Number = input()
                         user_list = Phone_Number.split()
                     else:
# Receiving the address from the user
                          print("Please enter the address: ")
                          Address = input()
                          print("The record created successfully !")
                          Record=[Username,Email_Address,user_list,Address,Date]
                          write_data(Record)
                          get_data()

# If the user insert "2" to update the record we will make update function.
        elif (choice == "2"):
            update_record()
            get_data()
# If the user insert "3" to delete the record we will make delete function.
        elif(choice == "3"):
            delete_record()
            get_data()
# If the user insert "4" to view the record we will make view function.
        elif (choice == "4"):
            view_data()
            get_data()
# If the user insert "5" to exit we will make exit function.
        elif (choice == "5"):
            exit()
