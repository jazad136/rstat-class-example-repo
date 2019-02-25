#transform.R
# ensure packages dplyr and nycflights13 are installed
# install.packages(c("nycflights13", "dplyr"))

library("nycflights13")
library("dplyr")

jan1 <- filter(flights, month == 1, day == 1)
nov_dec <- filter(flights, month %in% c(11, 12))
#or's are lists, ands are separate arguments. 
# flights with arrival delay of 2 or more hours
filter(flights, arr_delay >= 2)[,c("arr_delay")]
# flights that flew to iah or hou (two houston,tx airport destinations)
iah_hou <- filter(flights, dest == "IAH" | dest=="HOU")
iah_hou[,12:16]

# find the columns that start with the substring "dep"
select(flights, starts_with("dep"))
# find the columns that contain the substring "dep"
select(flights, contains("dep"))
# find the columns that end in the substring "time"
select(flights, ends_with("time"))

# retrieve a list of flights that all departed right on time and arrived right on time (only 347) 
on_time <- filter(flights, sched_dep_time == dep_time, sched_arr_time == arr_time)

# reduce the flights table to some meaningful ones
flights_sml <- select(flights, 
  year:day,
  ends_with("delay"),
  distance,
  air_time
)
flights_sml <- select(flights, 
  year:day,
  ends_with("delay"),
  distance,
  air_time
)
flights_sml2 <- mutate(flights_sml, 
       gain = dep_delay - arr_delay, 
       speed = distance/air_time * 60
)
flights_sml3 <- mutate(flights_sml,
                       gain = dep_delay - arr_delay,
                       hours = air_time / 60,
                       gain_per_hour = gain/hours
)
flights_t <- transmute(flights,
         gain = dep_delay - arr_delay,
         hours = air_time / 60,
         gain_per_hour = gain / hours
)                       

