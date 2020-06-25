library(swirl)
swirl()
data("cars")
data(cars)
cars
?cars
head(cars)
dim(cars)
plot(cars)
?plot
plot(x = cars$speed, y = cars$dist)
plot(y = cars$speed, x = cars$dist)
plot(y = cars$dist, x = cars$speed,xlab = "Speed")
plot(x = cars$speed, y =cars$dist ,ylab = "Stopping Distance")
plot(x = cars$speed, y =cars$dist ,xlab = "Speed",ylab = "Stopping Distance")

plot(cars,main = "My Plot")
plot(cars, sub = "My Plot Subtitle")
plot(cars,col=2)
plot(cars,xlim=c(10,15))
?points
plot(cars,pch=2)
mtcars
data(mtcars)
?boxplot
boxplot(mpg~cyl,mtcars)
hist(mtcars$mpg)

