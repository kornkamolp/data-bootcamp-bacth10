# Task 1: Create a webpage timer function
''' This task makes use of a function called sleep() from the time module. 
Whenever sleep(n) is executed, the program will pause for n seconds. 
Run the below cell as an illustrative example to help you understand. '''

from time import sleep

n = 3
while n >= 0:
    print(n)
    sleep(1)    # Execution pauses for 1 second
    n = n - 1   # Decrement n by 1

# Task 2:  write a function that counts down, that 1 second = 1 minute
''' 
write a function that counts down and reminds the user that they have 
limited time to make a selection.
When time expires, it must print a timeout message '''

from time import sleep

mins = 10

while mins >= 0:
    if mins == 5:
        print("Place your reservation soon! 5 minutes remaining.")
    elif mins == 2:
        print("Don't lose your seats! 2 minutes remaining.")
    elif mins == 0:
        print("User timed out.")
    else:
        print(mins)
    mins -= 1
    sleep(1)
