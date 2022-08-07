library (pacman)
pacman::p_load("tidyverse", "rvest", "janitor")

#URL

url_filmes <- "https://pt.wikipedia.org/wiki/Lista_de_filmes_de_maior_bilheteria"
pagina_filmes <- read_html(url_filmes)
tabela_filmes <- html_table(pagina_filmes)

data_filmes <- tabela_filmes[[1]]

data_filmes <- data_filmes %>%
  select(-c(6)) %>%
  clean_names()

glimpse(data_filmes)

data_filmes$bilheteria_us <- as.numeric(
  as.character(
    str_replace_all(
      data_filmes$bilheteria_us, "\\s", ""
    )
  )
)

data_filmes$distribuidor <- as.factor(
  as.character(
    data_filmes$distribuidor
  )
)

data_filmes$ano <- as.factor(
  as.integer(
    data_filmes$ano
  )
)

summary(data_filmes)


options(scipen = 999)

save(data_filmes, file="data_filmes.RData")
