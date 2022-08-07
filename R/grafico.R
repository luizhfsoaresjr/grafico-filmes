pacman::p_load("tidyverse")

load("data_filmes.RData")

glimpse(data_filmes)

unique(data_filmes$distribuidor)

data_filmes$distribuidor <- str_replace(data_filmes$distribuidor, "Universal Studios", "Universal Pictures")

ggplot(data = data_filmes)+
  geom_boxplot(aes(x=distribuidor, y=bilheteria_us))

distrib_famous <- data_filmes %>%
  filter(distribuidor == "Universal Pictures" | distribuidor=="Walt Disney Studios Motion Pictures" | distribuidor=="Warner Bros. Pictures" | distribuidor=="Paramount Pictures" | distribuidor=="New Line Cinema" | distribuidor=="DreamWorks" | distribuidor=="Columbia Pictures") %>%
  filter(ano=="2010" | ano=="2011" | ano=="2012" | ano=="2013" | ano=="2014" | ano=="2015" | ano=="2016" | ano=="2017" | ano=="2018" | ano=="2019" | ano=="2020" | ano=="2021" | ano=="2022")

summary(distrib_famous)

distrib_famous %>%
  ggplot(aes(x=ano, y=bilheteria_us, fill=distribuidor))+
  geom_col()+
  labs(title = "Gráfico de composição das maiores bilheterias por ano e distribuidor",
       subtitle = "Em bilhões de dólares", x="", y="",
       caption = "Fonte: Wikipedia")
