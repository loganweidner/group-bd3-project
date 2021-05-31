library(dplyr)

#graduation rate data
grad_rates <- read.csv('raw_data/grad_rate.csv') %>% 
  rename(state = ï..State, grad_rate = HighSchool)

#education spending per pupil data
pupil_spending <- read.csv('raw_data/pupil_spending.csv') %>% 
  rename(state = ï..State, pupil_spending = amountPerPupil)

#vaccination hesitancy data
vac_hesitancy <- read.csv('raw_data/vaccine_hesitancy.csv') %>% 
  #select relevant columns
  select(state = State, 
         hesitant = Estimated.hesitant, 
         strongly_hesitant = Estimated.strongly.hesitant,
         vaccinated = Percent.adults.fully.vaccinated.against.COVID.19) %>%
  group_by(state) %>% #group by state, make hesitancy 
  summarise(hesitant = mean(hesitant)*100, strongly_hesitant = mean(strongly_hesitant)*100) %>% 
  filter(state != 'DISTRICT OF COLUMBIA')

vac_hesitancy$state <- tolower(vac_hesitancy$state)
pupil_spending$state <- tolower(pupil_spending$state)
grad_rates$state <- tolower(grad_rates$state)

compiled_data <- full_join(vac_hesitancy, pupil_spending, by = 'state') %>% 
  full_join(grad_rates, by = 'state')

write.csv(compiled_data, 'data/hesitancy_and_education.csv')