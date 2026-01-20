## This script will check for essential packages for this class. We will also run some basic examples.

## The command 'library' will load a package into the R session. A package is just like starting a phone app in R. You can think R is your smartphone and the package is a phone app.
library( ape )

## Some functions in R (such as 'library') will not print anything to the console. The function will print an error if it occurs:
# library( this_other_cool_package )

## We get an error message back. There is no package with this name installed in R right now.
## If you got an error message when runing 'library(ape)', then you might need to install the package. This is easy. You can run the following command:
install.packages("ape")

## This will install the package 'ape'. We will be using this package today. So make sure it is loaded:
library( ape )

#############################################
## Functions and objects
#############################################

## Before we move on to more cool stuff. Let's quickly examine what each part of an R command means. Run the following command:
random_sample <- runif(n = 10, min = 1, max = 2)

## The line above is a call to the function 'runif'. We know 'runif' is a function because it is followed by parentheses. The statements inside it 'n = 10', 'min = 1', 'max = 2' are arguments for the function. We know these are arguments because they are inside the parentheses and separated by commas. Finally, the arrow '<-' is used to assign the output (or value) of the function to the object 'random_sample'.
## The object 'random_sample' will save the output from the function 'runif' such that we can work with it later.
## To check what 'runif' just did we can read its help page:
help( runif )

## The help frame in the right now shows the help page for the 'runif' function as well as other functions in the same family.
## The help page describes what the function computes and also the function arguments.
## Based on the help page, what 'runif' does? What are the meaning of the arguments we changed?

## We can check what is the value of an object by printing it to the console screen:
random_sample
## Or using a syntax more familiar to other programming languages:
print( random_sample )
## Both formats will have the same outcome.

## Calling the name of a object will print its value to the screen.
## Is there any difference in the numbers printed to the screen when called 'random_sample' or 'print(random_sample)' above? Why?

## Now, what do you think will happen if we define 'random_sample' again using the same function call to 'runif'?
random_sample <- runif(n = 10, min = 1, max = 2)

## Are the values stored on 'random_sample' the same as before? Why?

#############################################
## The anatomy of a command line
#############################################

## We will use lines of code to communicate with the R console. Although this seems annoying at first. A script with lines of code is a very powerful and reliable tool. Each line of code follow some syntax rules. These rules are very general.
## Let's evaluate a function call and explain each piece: 
sequence <- seq(from = 1, to = 5)
## These are the elements of this line of code, in order:
## object_name assign_symbol function_call open_parenthesis argument_name equal_sign argument_value comma argument_name equal_sign argument_value close_parenthesis

## Many errors in R happen because:
## 1) You forgot to open or close the parentheses.
## 2) You used a wrong name for an argument.
## 3) You forgot the comma separating arguments.

## It is important to pay attention to the basic syntax of R. 