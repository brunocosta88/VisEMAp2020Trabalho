library(dplyr)
library(tidyr)
library(sidrar)

# Get data - https://sidra.ibge.gov.br/tabela/4092 
ForcaTrabalho <- get_sidra(api = '/t/4092/n1/all/n2/all/n3/all/v/1641/p/all/c629/32385,32386,32387,32446')

# Add unemployed percentage
ForcaTrabalho_wide <- ForcaTrabalho %>%
  select(-'Condi��o em rela��o � for�a de trabalho e condi��o de ocupa��o (C�digo)') %>%
  spread('Condi��o em rela��o � for�a de trabalho e condi��o de ocupa��o', Valor) %>%
  mutate(PercentualDesocupapdo = `For�a de trabalho - desocupada` / `For�a de trabalho`)

# Export data to csv
write.csv(ForcaTrabalho_wide, "C:\\Users\\MediaTechLab\\Documents\\GitHub\\VisEMAp2020Trabalho\\ForcaTrabalho.csv", row.names = FALSE)
