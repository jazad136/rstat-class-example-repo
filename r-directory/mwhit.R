library(dplyr)
library(readr)

#write.csv(mtcars, "mtcars.csv", row.names=FALSE)
mainT <- read_csv("mtcars.csv")
#do 6 cylinder cars have equal weight as 4 cylinder cars? 
selT <- select(mainT, cyl, wt, everything())
