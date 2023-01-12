opened_Brackets = ["[","{","("]
closed_Brackets = ["]","}",")"]

def Check_Balanced_Brackets(Str):
    stack = []
    for i in Str:
        if i in opened_Brackets:
            stack.append(i)
        elif i in closed_Brackets:
                 pos = closed_Brackets.index(i)
                 if ((len(stack) > 0) and (opened_Brackets[pos] == stack[len(stack)-1])):
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
