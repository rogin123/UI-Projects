library(tidycensus)
library(tidyverse)
library(janitor)

poverty_population <- read.csv('Spatial Equity Tool/poverty_population.csv') 
total_population <- read.csv('Spatial Equity Tool/total_population.csv')
under_18 <- read.csv('Spatial Equity Tool/under18_population.csv')

pov_pop <- poverty_population[!apply(poverty_population == "", 1, all), ] 
tot_pop <- total_population[!apply(total_population == "", 1, all), ]
under_18 <- under_18[!apply(under_18 == "", 1, all), ]

# acs_18 <- load_variables(2018,"acs5")
# acs_subject_18 <- load_variables(2018,"acs5/subject")
# acs_profile_18 <- load_variables(2018,"acs5/profile")

acs_19 <- load_variables(2019,"acs5")
acs_subject_19 <- load_variables(2019,"acs5/subject")
acs_profile_19 <- load_variables(2019,"acs5/profile")

# 1) filter the codes in 2018 that are relevant 
# 2) find mismatches in the 2019 codes with the same names 


# Poverty Population ------------------------------------------------------

pov_acs <- acs_19 %>%
  filter(name %in% pov_pop$acs_vars)

pov_acs <- pov_acs[,c(2,1,3)]


# Total Population --------------------------------------------------------
tot_acs_19 <- acs_profile_19 %>% 
  filter(name %in% tot_pop$acs_vars)

  filter(label %in% tot_acs_18$label)


# Under 18 Pop ------------------------------------------------------------

youth_acs <- acs_profile_19 %>%
  filter(name %in% under_18$acs_vars)

youth_acs <- youth_acs[,c(2,1,3)]
