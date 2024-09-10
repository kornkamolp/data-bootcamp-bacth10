library(nycflights13)
library(dplyr)
# Practice Questions Using nycflights13
```
## 5 function in dplyr
## 1.select
## 2.filter
## 3.arrage
## 4.mutate
## 5.summarise
## other function: count, disticnt
## join tables, bind_row, bind_col
```
# 1. Average arrival delay for each airline
avg_delay_airline <- flights %>%
  group_by(carrier) %>%
  summarise(avg_arr_delay = mean(arr_delay, na.rm = TRUE))

#2 Find the departure time with the longest average delay per minute
df <- flights %>%
  select(carrier, month, dep_delay) %>%
  filter(dep_delay < 0) %>%
  group_by(month)

df %>%
  count(dep_delay) %>%
  arrange(-n) %>%
  head(5)


#3 counting the number of routes each plane flies on special days
#step 1, add a table of special dates
special_days <- tribble(
  ~year, ~month, ~day, ~holiday,
  2013, 01, 01, "New Years Day",
  2013, 12, 25, "Christmas Day"
)

#step 2, join column for special days 
data <- flights %>%
  arrange(year, month, day, sched_dep_time, carrier, flight) %>%
  inner_join(special_days)

data %>%
  select(year, month, day, holiday, carrier) %>%
  group_by(holiday) %>%
  count() %>%
  arrange(-n)
  
#4 total distance for all flights in December
flights %>%
  filter(month == 12) %>%
  summarise(total_distance = sum(distance)) 

#5 top one for flight hours 
flights %>%
  select(carrier, hour) %>%
  group_by(carrier) %>%
  summarise(sum_hour = sum(hour)) %>%
  head(1) %>%
  glimpse() #airline code is "9E" (Endeavor Air)

#6 What is the distribution of departure delays for flights to Seattle (SEA)?
seattle_flights <- flights %>%
                      select(dest, dep_delay) %>%
                          filter(dest == "SEA") %>% 
                          drop_na()
