## Guess the Number!!!

import random

games=''

while games=='':
    try:
        games=int(input("How many game would you like to play?"))
    except:
        print("Please select using a number")

for game in range(0,games):
    pick=random.randint(1,26)
    guess=None
    attempts=0
    
    while pick!=guess:
        try:
            guess=int(input("Pick a number:"))
        except:
            print("Please select a number.")
            continue
        
        if guess!=pick:
            attempts+=1
            if guess>pick:
                print("Too high")
            else:
                print("Too low")
        else:
            print("Correct! It took you this many guesses: %s" % attempts)
