library(tidyverse)

fix(cinc)
attach(cinc)
t <- tapply(poder, csonu, sum)
porc <- round(t*100, 2)

rotulos <- paste("(", porc, "%)", sep="")
pie(t, main="Gráfico de Pizza - Poder no CSONU", labels=rotulos, col=rainbow(2),
    sub="Fonte: COW(2021)", cex.main=1, cex.sub=0.5, col.main="darkblue", radius=1)
legend(locator(1), legend=rownames(t), fill=c(rainbow(2)), bty="n", cex=0.8, pt.cex=1:2, text.font=2)

