library(tidyverse)
banned <- c(
  "marine.villard01@chu-lyon.fr"
)

days <- c("monday_11h_12h30", "tuesday_11h_12h30", "friday_11h_12h30")
for( day in days) {
  read_tsv("trainee.tsv", skip = 2) %>% 
    janitor::clean_names() %>% 
    filter(!(email %in% banned)) %>% 
    select(c(
      sequentiel, email, lab,
      monday_11h_12h30, tuesday_11h_12h30, friday_11h_12h30,
      comments))  %>% 
    filter(!duplicated(email)) %>% 
    filter(
      .[[day]] %in% "first choice"
    ) %>% 
    select(c(
      email)) %>%
    write_csv(str_c(day, ".csv"))
}

