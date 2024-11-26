# Task 1
''' Write a while loop that will continue iterating until 5 candies have been purchased.'''
# Assign candy_purchased
candy_purchased = 0

#create an interative statement
while candy_purchased <= 5:
  print('Canday purchased: ' + str(candy_purchased))
  # Increment the candy_purchased counter
  candy_purchased += 1

# Task 2 interate using while and if
''' Write a while loop where candy_purchased begins at 0 and 
  stops after 100 purchases have been made. Your code must:
– Increment candy_purchased by one with each iteration
– Print 'Candy purchased: {number}' only when a multiple of 10 purchases have been
made '''
candy_purchased = 0

while candy_purchased <= 100:
  if candy_purchased % 10 == 0: # multiple of 10
    print('Canday purchased: ' + str(candy_purchased))
    candy_purchased += 1
