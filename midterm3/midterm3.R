# Midterm 3

# Write a function called numDollarElements. Your function should take the following
# arguments
#   <chvec>: A character vector containing strings of letters, possibly 
#     with the "$" symbol
#
# and return the following
#   <num.dollar>: an integer indicating how many elements of <chvec> contain the "$"
#     symbol. For example: numDollarElements(c('dollar', 'd$llar', '$$$')) should return 2

numDollarElements <- function(chvec) {
  dollarEl <- grep("\\$", chvec)
  return(length(dollarEl))
}

# PASSES ALL MY TESTS

# Write a function called prodDigits that compute the product of all (single) digits in
# a string.  The function should return 0 if there is no digit in the
# string. Your function should take the following arguments:
#   <chvec>: A character vector of length 1 (chvec contains only 1 string)
#
# and return the following
#   <total>: A single number (the product of all digits in chvec)
prodDigits <- function(chvec) {
  digitidcs <- gregexpr("[0-9]", chvec)[[1]]
  if (digitidcs[1] == -1) {
    return(0)
  } else {
    product = 1
    for (i in digitidcs) {
      product = product * as.integer(substr(chvec, i, i))
    }
    return(product)    
  }
}



# Some test cases:
all.equal(prodDigits("1z3p ! 22"), 12)
all.equal(prodDigits("abcdefg"), 0)

# Write a function called hisToHer that converts every instance of 
# him in a string to her; every instance of he to she and every instance 
# of his to her. You can assume everything is lower case. Be careful not 
# to replace words that contain him/he/his (eg you don't want to
# replace the with ther). Your function should take the argument
#   <chvec>: A character vector
#
# and return
#   <herchvec>: The same character vector with the required substitutions.
hisToHer <- function(chvec) {
  vec1 <- gsub("\\<him\\>", "her", chvec)
  vec2 <- gsub("\\<he\\>", "she", vec1)
  herchvec <- gsub("\\<his\\>", "her", vec2)
  return(herchvec)
}


# A test case
all.equal(
  hisToHer("he went to the store his mother gave him"), 
  "she went to the store her mother gave her"
)


# Write a function called mostCommonLetter that finds the most common 
# letter in a string. If there is a tie for most common letter return 
# all of the letters that were most common. Your function should 
# convert all letters in the string to *lower case* and you should 
# remove  everything other than letters. 
# Your function has the argument
#  <chvec>: A character vector of length 1 (chvec contains only 1 string)
#
# and it should return
#  <letter> The most common letter or letters in the string.
# For example mostCommonLetter("aabbccccdddd") should return 
# [1] "c" "d"
mostCommonLetter <- function(chvec) {
  lowerCase <- tolower(chvec)
  tableChvec <- table(unlist(strsplit(chvec, "")))
  maxTable <- max(tableChvec)
  common <- c()
  for (i in 1:length(tableChvec)) {
    if (tableChvec[i] == maxTable) {
      common <- c(common, names(tableChvec)[i])
    }
  }
  return(common)
}
