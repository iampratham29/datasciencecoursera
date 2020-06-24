library(swirl)
swirl()
YOURNAME
1
1
11
sapply(flags,unique)
vapply(flags, unique,  numeric(1))
ok()
sapply(flags, class)
vapply(flags, class, character(1))
?tapply
table(flags$landmass)
table(flags$animate)
tapply(flags$animate,flags$landmass, mean)
tapply(flags$population, flags$red, summary)
tapply(flags$population,flags$landmass, summary)
3
