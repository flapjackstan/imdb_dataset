library("tidyverse")
library("ggplot2") 
library("ggthemes")
library('ggridges')

#a
getwd()
setwd("C:/Users/Elmer/Documents/R/Statistical Modeling/PSET1/imdb_dataset")

#b
imdb = read.csv("movie_metadata.csv")

#c - dimensions of df
dim(imdb)

#d - header info
names(imdb)

imdb <- imdb %>% 
  mutate(grossM = gross / 1000000,
         budgetM = budget / 1000000)

#e 
sp1 <- 
  ggplot(data = imdb)+ 
  geom_point( mapping = aes(x = imdb_score, y = budgetM), color = "green" ) +
  labs(x = "IMDB Score",
       y = "Budget",
       title = "IMDB Score by Budget (Categorized by Rating)")+
  ggthemes::theme_economist()


#f - filter budget over provided amount
imdb <- imdb %>% filter(budget < 400000000)
dim(imdb)

#g
sp2 <- 
  ggplot(data = imdb)+ 
  geom_point( mapping = aes(x = imdb_score, y = budget), color = "green" ) +
  stat_smooth( mapping = aes(x = imdb_score,y = budget) )+
  labs(x = "IMDB Score",
       y = "Budget",
       title = "IMDB Score by Budget (Categorized by Rating)")+
  ggthemes::theme_economist()


#h
sp3 <- 
  ggplot(data = imdb)+ 
  geom_point( mapping = aes(x = imdb_score, y = budget), color = "green" ) +
  stat_smooth( mapping = aes(x = imdb_score,y = budget) )+
  facet_wrap(~ content_rating, scales = "free") +
  labs(x = "IMDB Score",
       y = "Budget",
       title = "IMDB Score by Budget (Categorized by Rating)")+
  ggthemes::theme_economist()

sp3

#i
imdb <- imdb %>% 
  mutate(genre_main = unlist(map(strsplit(as.character(imdb$genres),"\\|"),1)),
         grossM = gross / 1000000,
         budgetM = budget / 1000000)

sp4 <- ggplot(imdb, aes(x = grossM, y = genre_main, fill = genre_main)) + 
  geom_density_ridges() + 
  scale_x_continuous(limits = c(0, 500)) +
  labs(x = "Box Office Gross (USD Millions)", 
       y = "Main Genre")



#i
imdb <- imdb %>% 
  mutate(genre_main = unlist(map(strsplit(as.character(imdb$genres),"\\|"),1)),
         grossM = gross / 1000000,
         budgetM = budget / 1000000)

filterd <- imdb %>% filter(content_rating %in% c("PG","R"))

sp5 <- 
  ggplot(data = filterd)+ 
  geom_point( mapping = aes(x = budgetM, y = grossM)) +
  stat_smooth( mapping = aes(x = budgetM,y = grossM) )+
  facet_wrap(~ content_rating, scales = "free") +
  labs(x = "Budget",
       y = "Gross",
       title = "Budget by Gross (Categorized by Rating)")

sp5


