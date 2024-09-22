## Basic Arithmetic operations----
# we added 2 in 3
2+3 
# we will add x in y
x = 2
y = 3
x+y
y-x
x-y
x*y
x^y
2^3
2*2*2
x/3


### Some other operators----
a <- 2
b <- 4+2
b
print(b)
a*2+b-(3^2)/(10*300)


## Data structures in R----
## 1. Vectors
# Vectors are one dimensional arrays that can hold numeric data, character data, or logical data.
# The elements in a vector all have the same data type.
# Vectors are created using the c() function. You place the vector elements separated by a comma between the c() function's parentheses.

# Numeric vector
num_vector <- c(1, 2, 3, 4, 5)
num_vector

# Character vector
char_vector <- c("a", "b", "c", "d", "e")
char_vector

# Logical vector
logical_vector <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
logical_vector

# Dataframes in R----
# Dataframes are two-dimensional arrays that can hold numeric data, character data, or logical data.
# They are similar to matrices but can have columns of different data types.
# Columns of a dataframe can be of different types.
# Dataframes are created using the data.frame() function.

# Create a dataframe
df <- data.frame(
  num = c(1, 2, 3, 4, 5),
  char = c("a", "b", "c", "d", "e"),
  logical = c(TRUE, FALSE, TRUE, FALSE, TRUE),
  num2 = c(12,14,16,18,20)
  )
df
View(df)


# Matrix in R ----
# Matrices are two-dimensional arrays that can hold numeric data, character data, or logical data.
# They are similar to vectors but can have rows and columns.
# Matrices are created using the matrix() function.

# Create a matrix
mat <- matrix(
  c(1, 2, 3, 4, 5, 6),
  nrow = 2,
  ncol = 3
)
mat
View(mat)





## Arrays in R----
# Arrays are similar to matrices but can have more than two dimensions.
# Arrays are created using the array() function.

# Create an array
arr <- array(
  c(1, 2, 3, 4, 5, 6, 7, 8),
  dim = c(2, 2, 2)
)
arr

# List in R----
# Lists are the R objects which contain elements of different types 
# like − numbers, strings, vectors and another list inside it.
# A list can also contain a matrix or a function as its elements.
# List is created using list() function.

# Create a list
list_data <- list(
  num = c(1, 2, 3, 4, 5),
  char = c("a", "b", "c", "d", "e"),
  logical = c(TRUE, FALSE, TRUE, FALSE, TRUE)
)








#3 Seq function in R ---
# The seq() function is used to generate sequences in R.
# The seq() function generates a sequence of numbers from a specified range.
# The seq() function takes three arguments: from, to, and by.

# Generate a sequence from 1 to 10
seq(1, 10)
seq(from=1, to=10)
seq(1, 10, by = 1)
seq(1, 10, by = 2)
seq(0, 10, by = 2)
seq(0, 10, by = 2.5)
seq(5, 10, by = 1.5)
seq(5, 1000000000000, by = 15000)

# length.out argument
seq(1, 10, length.out = 20)

# along.with argument
vec <- c(10,20,30,40, 50)
seq(along.with = vec)


# descending sequence
seq(10, 1, by = -1)

seq(1,10, 2)
