library(dplyr)
library(readr)
library(purrr)
library(nycflights13)

# understand <- read_csv("understand.csv")
# G = read.csv("understand.csv")
# by_day <- group_by(flights, year, month, day)
# summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))
# by_dest <- group_by(flights, dest)

write.csv(mtcars, "mtcars.csv")
write.csv(mtcars, "mtcars.csv", row.names=FALSE)
mainT <- read_csv("mtcars.csv")
mainTT <- tibble(mtcars)

#do 6 cylinder cars have equal weight as 4 cylinder cars? 
# to 