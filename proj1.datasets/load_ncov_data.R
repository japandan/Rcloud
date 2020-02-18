library(dplyr)
library(tidyr)

ncov_df<-readr:::read_csv(here::here("proj1.datasets/2019_nCoV_data.csv"))
ncov_confirmed_df<-readr:::read_csv(here::here("proj1.datasets/time_series_2019_ncov_confirmed.csv"))
ncov_deaths_df<-readr:::read_csv(here::here("proj1.datasets/time_series_2019_ncov_deaths.csv"))
ncov_recovered_df<-readr:::read_csv(here::here("proj1.datasets/time_series_2019_ncov_recovered.csv"))

summary(ncov_df)
summary(ncov_deaths_df)
summary(ncov_confirmed_df)
summary(ncov_recovered_df)

country_totals_df<-ncov_confirmed_df %>% group_by(`Country/Region`) %>% summarise(total_02_09=sum(`02/09/20 23:20`))
country_totals_df<-country_totals_df %>% rename(
  region='Country/Region'
)
barplot(country_totals_df$total_02_09,
        main="Totals by Country",
        xlab="Country")