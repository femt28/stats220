library(magick)

colours <- c("#fc746c","#06BAC1","#FFEEDB","#424874","#88498F")

blank <- image_blank(width=600, height=400, color = "#FFEEDB")

################################

text1 <- "The difference in content and engagement between youtubers" %>% str_wrap(40)

slide1 <- c(blank, blank) %>%
  image_append() %>%
  image_annotate(text=text1, size=40, gravity="center")

################################

text2 <- "Here we can see that the long form videos and short form short are produced in similar amounts" %>% str_wrap(40)
text2gif <- blank %>%
  image_annotate(text=text2, size=30, gravity="center")

plot1 <- image_read("plot1.png") %>%
  image_scale("600")

slide2 <- c(text2gif, plot1) %>%
  image_append()

################################

text3 <- "If we compared the length of the video title to the number of comments, we can see the difference in engagement between the youtubers as well" %>% str_wrap(40)
text3gif <- blank %>%
  image_annotate(text=text3, size=30, gravity="center")

plot2 <- image_read("plot2.png") %>%
  image_scale("600")

slide3 <- c(text3gif, plot2) %>%
  image_append()

################################
text4 <- "If we were to compare the number of videos released per year from the data we collected, we can see the API returned more videos for Donut, and more shorts for Joshua Weissman, which is interesting to see." %>% str_wrap(40)
text4gif <- blank %>%
  image_annotate(text=text4, size=30, gravity="center")

plot3 <- image_read("plot3.png") %>%
  image_scale("600")

slide4 <- c(text4gif, plot3) %>%
  image_append()

################################
text5 <- "Overall, I learned that Donut gets roughly the same comments for their videos, while Joshua got much more variety in comments, but they were for mainly shorts. This was interesting to see as both channels have similar subscriber numbers but Donut having 3 times more videos and shorts." %>% str_wrap(50)

slide5 <- c(blank, blank) %>%
  image_append() %>%
  image_annotate(text=text5, size=40, gravity="center")

frames <- c(rep(slide1, 8), rep(slide2, 8), rep(slide3, 8), rep(slide4, 8), rep(slide5, 8))
gif <- image_animate(frames, fps=1) %>%
  image_write("data_story.gif")
gif

