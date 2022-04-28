install.packages("foreign")
install.packages("ggmap")
install.packages("reshape2") 
install.packages("maps") 
install.packages("Cairo") 

library(foreign)
library(ggmap)
library(ggplot2)
library(reshape2)
library(maps)
library(Cairo)

attach(economia)
econ <- subset(economia, select=c(country, income_tax_rate))
world = map_data("world")
world1 <- merge(world, econ, by.x="region", by.y="country", all.x=T, all.y=F)
world1 <- world1[order(world1$order),]

m0 <- ggplot(data=world1)
m1 <- m0 + geom_polygon(aes(x=long, y=lat, group=group, fill=income_tax_rate)) +
  coord_equal()
m2 <- m1 + geom_path(aes(x=long, y=lat, group=group), color="grey", size=.1)
m3 <- m2 + scale_fill_gradient(low="lightblue", high="darkblue")

m3
