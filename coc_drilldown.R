library(tidyverse)
library(usdata)

coc <- read.csv('Grantee_Contacts_06272021_final.csv') %>% 
  mutate(state = substring(OrgName, 0,2),
         OrgName = substring(OrgName, 10))

coc <- distinct(coc, OrgName,.keep_all = TRUE) %>% 
  mutate(state = abbr2state(state))

write.csv(coc,"coc_drilldown.csv")


# PHA drilldown -----------------------------------------------------------

pha <- read_csv('pha_drilldown.csv') %>% 
  mutate(State = abbr2state(State))
 
pha %>% 
  filter_all(any_vars(is.na(.)))

write.csv(pha, "pha_drilldown.csv")

# coc %>% 
#   filter_all(any_vars(is.na(.))) %>% 
#   mutate(state = c("American Samoa", "Guam", "Northern Mariana Islands", "Puerto Rico", 
#                    "Puerto Rico", "Virgin Islands"))
