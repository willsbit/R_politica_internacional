install.packages('summarytools')
library(summarytools)


attach(guerras)
tapply(guerras$mortes, guerras$pais, sum)
freq(pais, cumul = TRUE, totals = FALSE, order = "freq")

descr(guerras[,6:7], style="rmarkdown") # estatisticas descritivas das colunas anos e mortes

brazil <- subset(guerras, pais=="Brazil")
descr(brazil[,6:7], style="rmarkdown") # estatisticas descritivas das colunas anos e mortes em guerras no Brasil
