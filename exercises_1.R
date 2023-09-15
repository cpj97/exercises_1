# Set-up your script ------------------------------------------------------

# install.packages(c("tidyverse", "gapminder", "pacman")) # uncomment if already installed
pacman::p_load(tidyverse, gapminder)

# Load your Data into R ---------------------------------------------------

data(gapminder)
head(gapminder)

# Clean your Data ---------------------------------------------------------

gapminder_clean <- gapminder %>% 
  rename(life_exp = lifeExp, gdp_per_cap = gdpPercap) %>% 
  mutate(gdp = pop * gdp_per_cap)

# Exercise 2 ---------------------------------------------------------------
gapminder_america <- subset(gapminder_clean, gapminder_clean$continent == "Americas")

gapminder_america <- gapminder_america %>% 
  mutate(poor = ifelse(gdp_per_cap <= 2000, 1, 0))