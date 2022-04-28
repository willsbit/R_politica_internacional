install.packages("ggplot2")

library(ggplot2)
ggplot(vetos_CSONU, aes(fill=anos, y=pais, x=vetos)) + geom_bar(positio="stack", stat="identity")+
  labs(title="Vetos das Potências CSONU", subtitle="Fonte: Dyson (2013)", 
  x="Número de vetos", y="Potências com Poder de Veto")
