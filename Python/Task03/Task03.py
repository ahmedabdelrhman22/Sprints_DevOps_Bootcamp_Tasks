Opened_Brackets = ["[","{","("]
Closed_Brackets = ["]","}",")"]

def Check_Balanced_Brackets(Str):
    stack = []
    for i in Str:
        if i in Opened_Brackets:
            stack.append(i)
        elif i in Closed_Brackets:
                 pos = Closed_Brackets.index(i)
                 if ((len(stack) > 0) and (Opened_Brackets[pos] == stack[len(stack)-1])):
                     stack.pop()
                 else:
                     return "NO"
    if len(stack) == 0:
        return "YES"
    else:
        return "NO"


if __name__ == '__main__':
    print("Please enter the brackets")
    string = input()
    Y_or_N = Check_Balanced_Brackets(string)
    print(Y_or_N)
