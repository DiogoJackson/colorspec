## code to prepare `visual peaks of podarcis` dataset goes here

#import data ----
podarcis_visualpeaks <- read.csv("data-raw/podarcis_visualpeaks.csv", sep = ",")

#salvar para o pacote ----
usethis::use_data(podarcis_visualpeaks, overwrite = TRUE)
