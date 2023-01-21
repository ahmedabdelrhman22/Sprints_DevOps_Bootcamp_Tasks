import csv
from os import path
def view_data():
# Getting the name of file the user wants to view.
    print("please enter the file name you want to view ")
    filename = input()
# Checking the validation of file which user entered.
    while not (path.exists(filename)):
        print("the file is not exist, please enter valid file name")
        filename = input()
    else:
# Setting initial value of the counter to zero
        rowcount = 0
# Iterating through the whole file
        for row in open(filename):
            rowcount += 1
        if (rowcount == 1):
            print("There is no data in the file ! ")
        else:
# Reading the data in the file.
             with open(filename, 'r') as file:
                 csv_reader = csv.reader(file)
                 for row in csv_reader:
                     print(row)