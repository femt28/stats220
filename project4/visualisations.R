library(tidyverse)

youtube_data <- read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vRI8VDHH7vvWXwknbQ_ZfVRhjOb8SYTIleo0EaOqdiL6XZaDGmNN80V1_Ibbp6pPhnaNU-5fTxROeV7/pub?output=csv")


summarised_data <- youtube_data %>%
  mutate(video_type = ifelse(duration > 90, 'video','short')) %>%
  mutate(year = datePublished %>% str_sub(1,4) %>% parse_number())



data1 <- summarised_data %>%
  group_by(video_type) %>%
  summarise(n=n()) %>%
  ungroup()

my_theme <- theme(
  plot.background = element_rect(fill = "#FFEEDB"),
  panel.background = element_rect(fill = "#FFEEDB"),
  panel.grid = element_blank(),
  axis.ticks = element_line(),
  axis.line = element_line(),
  plot.margin = margin(1, 1, 1, 1, "cm")
)
#############################

# type of videos across both channels
type_of_video <- ggplot(data = data1) +
  geom_col(aes(x=video_type, y=n), fill = "#88498F") +
  my_theme +
  labs(title = "Overall Video Type",
       x="Video Type",
       y="Number of videos")
type_of_video

# title length vs comments
plot2 <- ggplot(data = summarised_data) +
  geom_point(aes(x=titleLength, y=commentCount, colour=video_type)) +
  my_theme +
  facet_wrap(vars(channelName)) +
  labs(title="Title Length vs Comments",
       x="Length of Title",
       y="Number of Comments",
       colour="Video Type")

# video type over time
plot3 <- ggplot(data = summarised_data) +
  geom_bar(aes(x=year, fill=video_type), position="dodge") +
  facet_wrap(vars(channelName)) +
  scale_x_continuous(breaks = seq(2014, 2024, 1)) +
  my_theme +
  labs(title="Variety Of Videos",
       x="Year Released",
       y="Number of videos",
       fill="Video Type")

ggsave("plot1.png", plot=type_of_video, width = 10, height = 7, units = "in")
ggsave("plot2.png", plot=plot2, width = 10, height = 7, units = "in")
ggsave("plot3.png", plot=plot3, width = 10, height = 7, units = "in")

