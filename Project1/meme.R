library(magick)

#Static meme texts

first_text <- image_blank(width = 450, height = 450, color = "#FFFFFF") %>% 
  image_annotate(text = "When you have to \n start a project", color = "#000000", size = 45, font = "Trebuchet", gravity = "center")

second_text <- image_blank(width = 450, height = 450, color = "#FFFFFF") %>% 
  image_annotate(text = "It's to make a meme", color = "#000000", size = 45, font = "Impact", gravity = "center")


#Static meme vectors and meme itself

top_image <- image_read("images\\top_image.png") %>%
  image_scale(450)

bottom_image <- image_read("images\\bottom_image.png") %>%
  image_scale(450)

top_vector <- c(first_text, top_image)%>%
  image_append()
bottom_vector <- c(second_text, bottom_image)%>%
  image_append()

c(top_vector, bottom_vector)%>%
  image_append(stack = TRUE) %>%
  image_write("my_meme.png")



#gif texts

third_text <- image_blank(width = 450, height = 450, color = "#FFFFFF") %>% 
  image_annotate(text = "It's due on Wednesday", color = "#000000", size = 45, font = "Impact", gravity = "center")

fourth_text <- image_blank(width = 450, height = 450, color = "#FFFFFF") %>% 
  image_annotate(text = "It's Monday", color = "#000000", size = 45, font = "Impact", gravity = "center")

fifth_text <- image_blank(width = 450, height = 450, color = "#FFFFFF") %>% 
  image_annotate(text = "I did it pls give me an A", color = "#000000", size = 45, font = "Impact", gravity = "center")

#gif vectors and gif

third_image <- image_read("images\\animation_3.png") %>%
  image_scale(450)
third_vector <- c(third_text, third_image)%>%
  image_append()
fourth_image <- image_read("images\\animation_4.png") %>%
  image_scale(450)
fourth_vector <- c(fourth_text, fourth_image)%>%
  image_append()
fifth_image <- image_read("images\\animation_5.png") %>%
  image_scale(450)
fifth_vector <- c(fifth_text, fifth_image)%>%
  image_append()


frames <- c(top_vector, bottom_vector, third_vector, fourth_vector, fifth_vector)
gif <- image_animate(frames, fps=1) %>%
  image_write("my_animation.gif")


