library(tidyverse)

song_data <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vQjF1Hf5KQ9--IboWbmaXJ14tknXsXUcfTlqZM4CVI3OiSnG_w6BxQcD5EJ4lvF5UeVXXLPmWyckJQ2/pub?gid=1225680565&single=true&output=csv")

song_data %>% slice(5:12) %>% print()


song_data %>%
  ggplot() +
  geom_bar(aes(x = track_id, fill = mode_name))