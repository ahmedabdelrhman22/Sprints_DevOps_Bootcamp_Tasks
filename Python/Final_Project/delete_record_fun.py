import pandas as pd
from os import path
def delete_record():
# Receiving name of file from user
    print("Please enter the name of file you want to delete it")
    filename=input()
# Checking there is a file with that name or not
    while not (path.exists(filename)):
        print("the file is not exist, please write valid file name")
        filename = input()
    else:
# Reading the file
        Read_file = pd.read_csv(filename)
#Setting initial value of the counter to zero
        rowcount  = 0
#iterating through the whole file
        for row in open(filename):
           rowcount+= 1
        if (rowcount == 1 ):
            print("There is no data in the file ! ")
        else:
# Receiving the username from user.
            print("Please enter the username you want to delete his data")
            username = input()
# Iterate in file data.
            for index, row in Read_file.iterrows():

# Checking the name which the user entered.
                while not (row['Username'] == username ):
                       print("Please enter the valid username you want to delete his data")
                       username = input()
# Deleting the record from the excel sheet.
                else:
                     rowindex = index
                     Read_file = Read_file.drop(Read_file.index[rowindex])
                     print("Record deleted successfully")
                     Read_file.to_csv(filename, index=False)