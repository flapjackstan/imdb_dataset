library("tidyverse") #dplyr::filter()
library("ggplot2") #ggplot()
library("ggthemes")#themes()

setwd("C:/Users/Elmer/Documents/R/Statistical Modeling/PSET1")
csv_loc = "movie_metadata.csv"
plot_name = "IMDB Score By Budget Plot"

imdb = read.csv(csv_loc)

#1c - dimensions of df
dim(imdb)

#1d - header info
names(imdb)

#1e - filter budget over provided amount
imdb <- imdb %>% filter(budget < 400000000) 

#scatter plot of df
sp <- 
  ggplot(data = imdb)+ 
  geom_point( mapping = aes(x = imdb_score, y = budget), color = "green" ) +
  geom_smooth( mapping = aes(x = imdb_score,y = budget) )+
  labs(x = "IMDB Score",
       y = "Budget",
       title = "My Plot")+
  ggthemes::theme_economist()

sp
  