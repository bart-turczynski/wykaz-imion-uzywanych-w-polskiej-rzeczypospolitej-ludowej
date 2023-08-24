library(tidyverse)

not_recommended_raw <-
  read_lines("aneks-do-obowiazujacego-wykazu-imion-negative.txt")

not_recommended_clean <- not_recommended_raw %>%
  str_split(",") %>%
  unlist() %>%
  enframe() %>%
  select(value) %>%
  rename("Name" = "value") %>%
  mutate(Name = str_squish(Name)) %>%
  separate("Name", into = c("Name", "Form"), "\\s") %>%
  mutate(Form = case_when(
    str_detect(Form, "\\(żeńskie\\)") ~ "f",
    str_detect(Form, "\\(męskie\\)") ~ "m"
    ))

not_recommended_clean

not_recommended_clean %>%
  write_csv("annex_given_names_negative.csv")

recommended_raw <-
  read_delim(
    "aneks-do-obowiazujacego-wykazu-imion-positive.txt",
    delim = ";",
    col_names = "Name",
    col_select = 1
  )

recommended_clean <- recommended_raw %>%
  separate_longer_delim(cols = "Name", delim = ", ") %>%
  separate_longer_delim(cols = "Name", delim = " i ") %>%
  separate("Name", into = c("Name", "Form"), "\\s") %>%
  mutate(Form = case_when(str_detect(Form, "\\(żeńskie\\)") ~ "f"))

recommended_clean

recommended_clean %>%
  write_csv("annex_given_names_positive.csv")
