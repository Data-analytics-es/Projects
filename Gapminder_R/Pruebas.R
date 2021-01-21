dataPath_2 <-  '/Users/borjapuig/Desktop/Data Science The Bridge/Repositorios GitHub/Repositorio_personal/R/gapminder/Gapminder_R/data/aged_15plus_employment_rate_percent.csv'
dataPath_1 <-  '/Users/borjapuig/Desktop/Data Science The Bridge/Repositorios GitHub/Repositorio_personal/R/gapminder/Gapminder_R/data/gdppercapita_us_inflation_adjusted.csv'
dataPath_target <-  '/Users/borjapuig/Desktop/Data Science The Bridge/Repositorios GitHub/Repositorio_personal/R/gapminder/Gapminder_R/data/long_term_unemployment_rate_percent.csv'
dataPath_3 <-  '/Users/borjapuig/Desktop/Data Science The Bridge/Repositorios GitHub/Repositorio_personal/R/gapminder/Gapminder_R/data/owid_education_idx.csv'

data_df_target <- read.csv(dataPath_target, check.names = F, header = T)
data_df_1 <- read.csv(dataPath_1, check.names = F, header = T)
data_df_2 <- read.csv(dataPath_2, check.names = F, header = T)
data_df_3 <- read.csv(dataPath_3, check.names = F, header = T)

library(reshape2)

data_df_melt_1 <- melt(data_df_1, id=c("country"), variable.name = 'Year', value.name = 'GDP')
data_df_melt_2 <- melt(data_df_2, id=c("country"), variable.name = 'Year', value.name = 'ER%')
data_df_melt_3 <- melt(data_df_3, id=c("country"), variable.name = 'Year', value.name = 'Edu')
data_df_melt_target <- melt(data_df_target, id=c("country"), variable.name = 'Year', value.name = 'LTUR')

df_final <- merge(data_df_melt_1,)


d <- 5
for(i in 1:10) { 
  nam <- paste("A", i, sep = "")
  assign(nam, rnorm(3)+d)
}
