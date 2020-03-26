library(tidyverse)
library(here)

# Import record data file
record_data <- read.csv(file = here("data", "record-data.csv"), stringsAsFactors = F)

# Publication by year
g_pub_year <-
  record_data %>% 
    group_by(Year) %>% 
    summarise(count = n()) %>% 
    ggplot() + 
    geom_bar(aes(x = Year, y = count), stat = "identity")

#Publication by country
g_pub_country <-
 record_data %>% 
    group_by(Country) %>% 
    summarise(count = n()) %>% 
    arrange(desc(count)) %>% 
    ggplot() + 
    geom_bar(aes(x = Country, y = count), stat = "identity")


## Graph export
ggsave("Publication-by-year.pdf", plot = g_pub_year, 
       width = 7, height = 5, units = "cm",
       path = here("plots"))

ggsave("Publication-by-country.pdf", plot = g_pub_country,
       width = 7, height = 5, units = "cm",
       path = here("plots"))
