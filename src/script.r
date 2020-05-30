source('init.r')


start <- function()
{
  resources()
  remove(h,i,k,z,x,y,result)
  main(DATA_INPUT)
  #View(result)
  # use different filenames for different data sets
  write.xlsx(result, "FILENAME.XLSX", sheetName = "sheet001")
}
