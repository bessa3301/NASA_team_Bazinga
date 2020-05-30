library(readxl)
library(dplyr)

alunos <- read_excel("R/source_data.xlsx", sheet = "Alunos")

admin <- read_excel("R/source_data.xlsx", sheet = "Admin")

operacional <- read_excel("R/source_data.xlsx", sheet = "Operacional")


View(alunos)
View(admin)
View(operacional)

#Sample Data
SZSZ <- read_excel("sample_dbg_data.xlsx", 
                              sheet = "Sample1")
View(SZSZ)

#### functions ####

# this function calls all others
# creates data frame for results to be inserted onto
main <- function(s){
  
  # How many rows there are
  totRows <- as.integer(nrow(s))
  
  # +1 for titles
  rw <- sum(totRows + 1) 
  
  # lenght of column wise document
  len <- length(s)
  
  result <- data.frame(x = rep(NA,rw), stringsAsFactors = F)
  
  a <- 1
  while (a < (len * 2)) {
    # len*2 since it goes by |name|result|name|result ...
    
    x <- rep(NA, rw)
    result <<- data.frame(result, x)
    a <- a+1
  
  } # while END
  
  stepInCols(s, result, len)
  
} # function END

stepInCols <- function(s, result, len) {
  
  # s = sheet;
  # result = empty data.frame;
  # len = lenght of sheet (cols)
  
  # increment i to skip columns
  i <- 1
  
  # Entering Column
  # !!!!!!! replace 1 with len !!!!!!!
  while (i <= len) {
    
    Sys.sleep(0.3)
  
    # titles ... name|"%"
    x <<- 1 # inc 2,2
    y <<- 2 # inc 2,2
    z <<- 1 # inc 1,1
  
    result[1,x] <<- colnames(s[i])
    Sys.sleep(0.3)
    result[1,y] <<- " % % % "
   
    # get column
    cc <- select(s,i)
    # sort + table occurencies
    ss <- as.data.frame(sort(table(cc), decreasing = T))
    # How many rows there are
    ll <- as.integer(nrow(ss))
    # percent?
    # pc <- percent(ss[z,2])
    
    Sys.sleep(0.3)
    appender(s,x,y,ss,ll,z)
 
    x <- x+2
    y <- y+2
    z <- z+1
    
    #print(x)
    #print(y)
    
    i <- i+1
  } # while END
  
} # function END

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
  
  #lenRw
  while (i<=ll) {
    #print('while was called')
    #print(i)
    
    if(length(ss) <= 1){
      print('WHERE IS THE LAMB SAUCE')
      # BUG FIX HERE (VECTOR TO WHERE IT WOULD ACTUALLY BE LOL)
      result[k,x] <<- as.character(s[1,z]) # strings
      Sys.sleep(0.3)
      result[k,y] <<- 100 # frequencies
    } else {
      result[k,x] <<- as.character(ss[i,1]) # strings
      Sys.sleep(0.3)
      result[k,y] <<- sum(ss[i,2]/percent(ss)) # frequencies
      print(percent(ss))
    }
    
    #result[k,x] <<- as.character(ss[i,1]) # strings
    #result[k,y] <<- sum(ss[i,2]/percent(ss)) # frequencies
    k <- k+1
    i <- i+1
  }
  print('outside of the fucking while loop')
}

remove(h,i,k,z,x,y,result)
# main(sample)
# []alunos  []admin   []operacional
main(alunos)
View(result)

#returns the percentual operator
percent <- function(obj){
  sum(obj[,2]/100) 
}

##################

library(xlsx)

#write.xlsx(result, "dungus.xlsx", sheetName = "sample", showNA = FALSE)
#write.xlsx(result, "FILENAME.XLSX", sheetName = "sample", showNA = FALSE)
# use different filenames for different data sets

write.xlsx(result, "OPERACIONAL-RES.xlsx", sheetName = "sample", showNA = FALSE)

write.xlsx(result, "R/OPERACIONAL-RES.xlsx", sheetName = "sample")
