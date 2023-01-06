# This function is for mutating the strings (replacing specific character in the string by another one) 
'''
1- firstly i made a function to set the string in the list to replace the character in a specific position by another one which i want.
2- joining the new character in the new string in the same function.
3- then returning the new string with the new character.
'''

def string_mutation(str,pos,char):
    l = list(str)
    l[pos] = char;
    str=''.join(l);
    return str


'''
1- receiving inputs from the user to set it in the function to retrieving the new string.
2- calling the function and set it in new string to return it.
3- printing the new string.
'''




if __name__ == '__main__':
    print("Please enter the string")
    s = input()
    print("Please enter the position of character in the list ")
    p = input()
    print("Please enter the new character that you want to replace it")
    c = input()
    new_s = string_mutation(s, int(p), c)
    print(new_s)


    
    '''
1- Sample input is "abracadabra","5" "k" ,
sample output is "abrackdabra"
2- Sample input"ahmed abdelrhman","9" "u" ,
sample output is "ahmed abdulrhman"
'''
