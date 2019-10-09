# Does news coverage boost support for presidential candidates in the Democratic primary?
# https://www.jacob-long.com/post/news-coverage-candidate-support/ 

library(tidyverse)
library(jtools)
library(tsibble)

################################ Getting the data ##############################
cable_mentions <- read_csv("https://github.com/fivethirtyeight/data/raw/master/media-mentions-2020/cable_weekly.csv")
online_mentions <- read_csv("https://github.com/fivethirtyeight/data/raw/master/media-mentions-2020/online_weekly.csv")
# Immediately convert `end_date` to date class
polls <- read_csv("https://projects.fivethirtyeight.com/polls-page/president_primary_polls.csv")


candidates <- c("Amy Klobuchar", "Andrew Yang", "Bernard Sanders",
                "Beto O'Rourke", "Bill de Blasio", "Cory A. Booker",
                "Elizabeth Warren", "Eric Swalwell", "Jay Robert Inslee",
                "Joe Sestak", "John Hickenlooper", "John K. Delaney",
                "Joseph R. Biden Jr.", "Julián Castro", "Kamala D. Harris",
                "Kirsten E. Gillibrand", "Marianne Williamson",
                "Michael F. Bennet", "Pete Buttigieg", "Seth Moulton",
                "Steve Bullock", "Tim Ryan", "Tom Steyer", "Tulsi Gabbard",
                "Wayne Messam")

candidates_clean <- c("Amy Klobuchar", "Andrew Yang", "Bernie Sanders",
                      "Beto O'Rourke", "Bill de Blasio", "Cory Booker",
                      "Elizabeth Warren", "Eric Swalwell", "Jay Inslee",
                      "Joe Sestak", "John Hickenlooper", "John Delaney",
                      "Joe Biden", "Julian Castro", "Kamala Harris",
                      "Kirsten Gillibrand", "Marianne Williamson",
                      "Michael Bennet", "Pete Buttigieg", "Seth Moulton",
                      "Steve Bullock", "Tim Ryan", "Tom Steyer",
                      "Tulsi Gabbard", "Wayne Messam")


########################### formating data #####################################

polls <- polls %>%
  # Convert date to date format
  mutate(end_date = as.Date(end_date, format = "%m/%d/%y")) %>%
  filter(
    # include only polls of at least modest quality
    fte_grade %in% c("C-", "C", "C+", "B-", "B", "B+", "A-", "A", "A+"),
    # only include polls ending on or after 12/30/2018
    end_date >= as.Date("12/30/2018", "%m/%d/%Y"),
    # only include *Democratic* primary polls
    party == "DEM",
    # only include the selected candidates
    candidate_name %in% candidates,
    # only national polls
    is.na(state),
    # Exclude some head-to-head results, etc.
    notes %nin% c("head-to-head poll",
                  "HarrisX/SR Democrat LV, definite voter",
                  "open-ended question")
  ) %>%
  mutate(
    # Have to add 1 to the date to accommodate tsibble's yearweek()
    # starting on Monday rather than Sunday like our other data sources
    week = as.Date(yearweek(end_date + 1)) - 1,
    # Convert candidate names to factor so I can relabel them
    candidate_name = factor(candidate_name, levels = candidates, labels = candidates_clean)
  )

polls_agg <- polls %>%
  group_by(week, candidate_name) %>%
  summarize(
    pct_polls = weighted.mean(pct, log(sample_size))
  )

library(ggplot2)
top_candidates <- c("Joe Biden", "Elizabeth Warren", "Bernie Sanders",
                    "Pete Buttigieg", "Kamala Harris", "Beto O'Rourke",
                    "Cory Booker")
ggplot(filter(polls_agg, candidate_name %in% top_candidates),
       aes(x = week, y = pct_polls, color = candidate_name)) +
  geom_line() +
  theme_nice()


media <-
  inner_join(cable_mentions, online_mentions, by = c("date", "name")) %>%
  mutate(
    # Create new variables that put the media coverage variables on
    # same scale as poll numbers
    pct_cable = 100 * pct_of_all_candidate_clips,
    pct_online = 100 * pct_of_all_candidate_stories
  )

top_candidates <- c("Joe Biden", "Elizabeth Warren", "Bernie Sanders",
                    "Pete Buttigieg", "Kamala Harris", "Beto O'Rourke",
                    "Cory Booker")
ggplot(filter(media, name %in% top_candidates),
       aes(x = date, y = pct_cable, color = name)) +
  geom_line() +
  theme_nice()

top_candidates <- c("Joe Biden", "Elizabeth Warren", "Bernie Sanders",
                    "Pete Buttigieg", "Kamala Harris", "Beto O'Rourke",
                    "Cory Booker")
ggplot(filter(media, name %in% top_candidates),
       aes(x = date, y = pct_online, color = name)) +
  geom_line() +
  theme_nice()


######################### Combine the data #####################################
joined <- inner_join(polls_agg, media,
                     by = c("candidate_name" = "name", "week" = "date"))

library(panelr)

# panel_data needs a number or ordered factor as wave variable
joined$wave <- as.ordered(joined$week)
joined_panel <- panel_data(ungroup(joined), id = candidate_name, wave = wave)
joined_pdata <- as_pdata.frame(joined_panel)


