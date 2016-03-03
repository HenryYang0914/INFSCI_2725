install.packages("ggplot2")
library("ggplot2", lib.loc="/Library/Frameworks/R.framework/Versions/3.2/Resources/library")
dat <- read.csv("/Users/JasonKing/Downloads/train.csv")
summary(dat)

#Whisker plot
ggplot(dat,aes(factor(Pclass),Age))+geom_boxplot(aes(fill = Pclass))+labs(title="Whisker plot")
#Histogram
ggplot(dat)+geom_histogram(aes(x=Age,fill=Sex),breaks=seq(0, 90, by =4), col="red")+labs(title="Histogram for Age&Sex")
#Facet_grid
ggplot(dat)+geom_bar(aes(factor(SibSp+Parch+1)))+facet_grid(Survived~Pclass)+labs(title="Facet_grid")
#Violin plot
ggplot(dat,aes(factor(Survived),Age))+geom_violin(aes(fill=Sex))+labs(title="Violin plot")
#Heatmap
require(reshape2)
require(plyr)
library(scales)
small <- dat[sample(nrow(dat),10),]
small.m <- melt(small)
small.m <- ddply(small.m, .(variable),transform,rescale=rescale(value)) 
ggplot(small.m,aes(variable,Name))+geom_tile(aes(fill=rescale),color='white')+scale_fill_gradient(low="white",high="steelblue")+labs(title="Heatmap for the first 10 samples")


