#basic stats
x = ceiling (rnorm(10000, mean=60, sd=20)) #ceiling to make into intergers
mean(x)
median(x)
#there is no mode function for mode stats
table(x)
sort(table(x), decreasing= T)

install.packages("modeest")
library(modeest)
mlv(x, method='shorth')

quantile(x) #divide into 4 parts
quantile(x, seq(.1,1,by=.1))  #decile divide into 10 parts
quantile(x,seq(.01,1,by=.01)) #percentile divide into 100 parts
library(e1071)
install.packages("e1071")
library(e1071)
plot(density(x))
e1071::skewness(x)
kurtosis(x)

sd(x); var(x)
cov(women$weight,women$height)
cor(women$height,women$height)
stem(x)
# freq table
install.packages("fdth")
library(fdth)
ftable1=fdt(x)
ftable1
