library(tidyverse)
library(jsonlite)
library(magick)

json_data <- fromJSON("pixabay_data.json")
pixabay_photo_data <- json_data$hits

# selceted pixabay photo data
selected_photos <- pixabay_photo_data %>%
  select(previewURL, pageURL, tags, likes, comments, downloads, user)

# 3 new variables
selected_photos <- selected_photos %>%
  mutate(
    num_likes = ifelse(likes < 500, "low",
                      ifelse(likes < 1000, "medium",
                             ifelse(likes < 1500, "high", "very high"))),
    ratio = comments / likes,
    user_length = nchar(user)
  )

# 58 photos
selected_photos <- selected_photos %>%
  filter(downloads > 100000)

# CSV file
write_csv(selected_photos, "selected_photos.csv")

mean_likes <- selected_photos$likes %>% mean(na.rm = TRUE)
mean_ratio <- selected_photos$ratio %>% mean(na.rm = TRUE)
total_downloads <- selected_photos$downloads %>% sum(na.rm = TRUE)



# summary values
cat("Mean Likes:", mean_likes, "\n")
cat("Mean Ratio:", mean_ratio, "\n")
cat("Total Downloads:", total_downloads, "\n")

# gif
img_urls <- selected_photos$previewURL %>% na.omit()

my_photos_gif <- image_read(img_urls) %>%
  image_join() %>%
  image_scale(500) %>%
  image_animate(fps=1) %>%
  image_write("my_photos.gif")


plot1 <- ggplot(data = selected_photos) + 
  geom_point(aes(x=comments, y=num_likes)) + 
  labs(title="More likes = more comments?",
       subtitle="Comparing the likes to comments",
       x="Number of comments",
       y="Number of likes")

plot1