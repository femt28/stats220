library(tidyverse)
library(jsonlite)

song_data <- fromJSON("https://stat.auckland.ac.nz/~fergusson/stats220_S124/data/lab4A.json")
song_data

explicit_songs <- song_data %>%
  mutate(song_type = ifelse(explicit, "Explicit", "Not explicit"))

explicit_songs %>%
  ggplot() +
  geom_bar(aes(y=song_type))

grouped_songs <- explicit_songs %>%
  group_by(song_type) %>%
  summarise(num_songs = n())

grouped_songs %>%
  ggplot() +
  geom_col(aes(y=song_type, x=num_songs))