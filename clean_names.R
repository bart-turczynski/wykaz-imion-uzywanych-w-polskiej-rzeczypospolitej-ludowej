# This code will let you recreate the final dataframe that stores
# all the given names present in the given_names.csv file

library(tidyverse)

#### Clean up female names ####

prl_female_given_names <-
  read_csv("feminine_given_names.txt",
           col_names = c("OCR"))

fixes_for_feminine_given_names <-
  read_csv("fixes_for_feminine_given_names.csv")

feminine_given_names <- prl_female_given_names %>%
  mutate(
    Form = "f",
    Popular = str_detect(OCR, "[[:upper:]]{2,}"),
    Temp = str_squish(str_remove(OCR, "^[[:punct:]]+"))
  ) %>%
  separate(
    Temp,
    into = c("Cleaner", "Suffix"),
    sep = "[[:punct:]]\\s+",
    remove = FALSE
  ) %>%
  mutate(
    Cleaner = Cleaner %>%
      str_squish() %>%
      str_to_sentence(),
    Suffix = case_when(str_detect(Suffix, "\\(") ~ "no change",
                       TRUE ~ Suffix)
  ) %>%
  left_join(fixes_for_feminine_given_names,
            by = "Cleaner") %>%
  mutate(Final = case_when(
    is.na(Final) ~ str_remove_all(Cleaner, regex("-|\\:|\\;|\\.|,|\\'|\\s|\\(.*\\)|")),
    !is.na(Final) ~ Final
  ))  %>%
  select(Final, Form, Popular) %>%
  rename("Name" = "Final")

#### Clean up male names ####
prl_masculine_given_names <-
  read_csv("masculine_given_names.txt",
           col_names = c("OCR"))

fixes_for_masculine_given_names <-
  read_csv("fixes_for_masculine_given_names.csv")

masculine_given_names <- prl_masculine_given_names %>%
  mutate(
    Form = "m",
    Popular = str_detect(OCR, "[[:upper:]]{2,}"),
    Temp = str_squish(str_remove(OCR, "^[[:punct:]]+"))
  ) %>%
  separate(
    Temp,
    into = c("Cleaner", "Suffix"),
    sep = "[[:punct:]]\\s+",
    remove = FALSE
  ) %>%
  mutate(
    Cleaner = Cleaner %>%
      str_squish() %>%
      str_to_sentence(),
    Suffix = case_when(str_detect(Suffix, "\\(") ~ "no change",
                       TRUE ~ Suffix)
  ) %>%
  left_join(fixes_for_masculine_given_names,
            by = "Cleaner") %>%
  mutate(Final = case_when(
    is.na(Final) ~ str_remove_all(Cleaner, regex("-|\\:|\\;|\\.|,|\\'|\\s|\\(.*\\)|")),
    !is.na(Final) ~ Final
  )) %>%
  filter(!str_length(Final) < 1) %>%
  select(Final, Form, Popular) %>%
  rename("Name" = "Final")

all_names <-
  bind_rows(feminine_given_names, masculine_given_names) %>%
  arrange(Name)

all_names
