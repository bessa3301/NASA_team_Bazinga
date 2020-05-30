
# first lets define some functions, so that the compiler knows what to do ^^

resources <- function()
{
  library(readxl)
  library(dplyr)
  library(xlsx)
}

# data must be passed as excel, or equivalent vector list.
DATA_INPUT <- read_excel("SOURCE_FILE.xlsx", sheet = "SHEET(optional)") 

#### functions ####

# despite Main function call others, its important to have all functions in your environment

# main() creates data frame for results to be inserted onto
# @dimensions = multidimensional
main <- function(s){
  
  # How many rows there are
  totRows <- as.integer(nrow(s))
  
  # +1 for titles (needed to be able to include all results)
  rw <- sum(totRows + 1) 
  
  # lenght of column-wise document
  len <- length(s)
  
  # result is declared inside of the scope at this moment, 
  # so that the interacions can be sucessifully saved to the global environment
  result <- data.frame(x = rep(NA,rw), stringsAsFactors = F)
  
  # @param while iterator
  a <- 1
  while (a < (len * 2)) {
    # len*2 since it goes by |Title|%%%|Title|%%%|...
    
    # operational scope variable
    x <- rep(NA, rw)
    # commit iteration to global scope
    result <<- data.frame(result, x)
    # increment a
    a <- a+1
  
  } # while END
  
  stepInCols(s, result, len)
  
} # function END

# @dimensions = 3
stepInCols <- function(s, result, len) {
  
  # s = sheet;
  # result = empty data.frame;
  # len = lenght of sheet (cols)
  
  # increment i to skip columns
  i <- 1
  
  # Entering Column
  while (i <= len) {
    
    Sys.sleep(0.3)
  
    # titles ... name|"%"
    # declared globally not to interfere with while scopes
    x <<- 1 # inc 2,2
    y <<- 2 # inc 2,2
    z <<- 1 # inc 1,1
  
    # appending "title" information to result data.frame
    result[1,x] <<- colnames(s[i])
    # improves confiability on slower processors, can be altered/removed on faster processors
    Sys.sleep(0.3)
    # adds this string to standarize serialization
    result[1,y] <<- " % % % "
   
    # get column
    cc <- select(s,i)
    # sort + table occurencies
    ss <- as.data.frame(sort(table(cc), decreasing = T))
    # How many rows there are
    ll <- as.integer(nrow(ss))
    
    Sys.sleep(0.3)
    appender(s,x,y,ss,ll,z)
 
    x <- x+2
    y <- y+2
    z <- z+1
    
    i <- i+1
  } # while END
  
} # function END

# @dimensions = [ multi -> bidimensional ]
appender <- function(s,x,y,ss,ll,z){
  
  # (s) reffers to the main sheet, as it is needed to compute 100% results
  # (x) should be passed right before incrementation
  # (y) is alike x, a iterator
  # (ss) is the column being passed as a paramenter
  # (ll) lenght of passed column
  # (z) uni-dimensional integer for sheet to column refference
  
  Sys.sleep(0.3)
  
  #names
  k <<- 2 
  i <<- 1 
  
  while (i<=ll) {
    
    # when a result is equal to 100%
    if(length(ss) <= 1){
      Sys.sleep(0.3)
      # since the compiler tries to sum two atomic vectors to culminate 100, 
      # but can't find two, since there is just one, the input is manual
      result[k,y] <<- 100 # percentage
      print("100%")
    } else {
      # when result is not == 100%
      result[k,x] <<- as.character(ss[i,1]) # strings
      Sys.sleep(0.3)
      result[k,y] <<- sum(ss[i,2]/percent(ss)) # percentage
      print("appended successfully")
    }
    
    k <- k+1
    i <- i+1
  }
  print('outside of the fucking while loop')
}

# CUSTOM FUNCTIONS

# calculate the percentual operator
percent <- function(obj){
  sum(obj[,2]/100) 
}

# *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*