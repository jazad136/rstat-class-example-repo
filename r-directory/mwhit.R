library(dplyr)
library(readr)

#write.csv(mtcars, "mtcars.csv", row.names=FALSE)
mainT <- read_csv("mtcars.csv")

#do 4 cylinder cars weigh as much as 8 cylinder cars? 
selT <- select(mainT, cyl, wt, everything())
selT
selT <- filter(selT, cyl == 4 | cyl == 8)
selT
# now reorder all the columns that contain cyl and wt, and create some groups.
cylT <- arrange(selT, cyl)
cylT
# how many elements of each set do we have? 
table(cylT$cyl)

# get the vectors of means
(twoT <- split(cylT, cylT$cyl))
fourT <- twoT$`4`
eightT <- twoT$`8`
wilcox.test(fourT$wt, eightT$wt)
#