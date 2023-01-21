import csv
import os
from datetime import date


def write_data(Record):
    Filename = str("contactbook_" + str((date.today())) + ".csv")
    Attributes_Names=['Username', 'Email_Address', 'Phone_Number','Address', 'Insertion_Date']
    with open(Filename, 'a+') as csvfile:
        Record_write = csv.writer(csvfile)
        if os.stat(Filename).st_size == 0:
            Header_write = csv.DictWriter(csvfile, fieldnames=Attributes_Names)
            Header_write.writeheader()
        Record_write.writerow(Record)