library(tidyverse)

learning_data <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vRtGcdZAI-wbZNfW4E2gr-iSrjg9txmnXfJn5snsp3PEAR_FZoT4QFOYBrtjeTsolc6BngFnzIYfHM_/pub?output=csv") %>%
  rename(
    number_of_accounts = 2,
    main_purposes = 3,
    avg_hours_spent = 4,
    browsing_frequency = 5,
    activity_during_usage = 6,
    time_spent_change = 7
  ) 

learning_data_longer <- learning_data %>%
  separate_rows(main_purposes, sep = ", ")%>%
  separate_rows(activity_during_usage, sep = ", ")%>% view()


plot1 <- ggplot(data = learning_data_longer) +
  geom_bar(aes(x=browsing_frequency, fill=time_spent_change))

plot2 <- ggplot(data= learning_data_longer) +
  geom_bar(aes(y=avg_hours_spent, fill= time_spent_change))

plot3 <- ggplot(data= learning_data_longer) +
  geom_bar(aes(y=main_purposes))


plot3

#plot1
#plot2

max(learning_data_longer$number_of_accounts)
mean(learning_data_longer$avg_hours_spent)
