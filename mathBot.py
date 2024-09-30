# Math Bot
# add sub mul div
# 2 var
# "usage: add|sub|mul|div v0 v1" if invalid input

def main():
    user_input = input("")
    split_values = user_input.split()
    v0 = int(split_values[1])
    v1 = int(split_values[2])
    if split_values[0] == "add":
        print(v0 + v1)
        return True
    if split_values[0] == "mul":
        print(v0 * v1)
        return True
    if split_values[0] == "div":
        if v1 == 0:
            print("can't divide by 0")
            return True
        else:
            print(v0 / v1)
        return True
    if split_values[0] == "sub":
        print(v0 - v1)
        return True
    if split_values[0] == "quit":
        return False
    else:
        print("usage: add|sub|mul|div v0 v1")
        return True


while True:
    if not main():
        break