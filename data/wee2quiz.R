library(httr)
install.packages("httpuv")
oauth_endpoints("github")

myapp <- oauth_app("github",
                   key = "75ffc4989df8001de43a",
                   secret = "389877827ca7031f4586a37206816ec5152088dc"
)

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)
output
names(output)
class(output)
output[2]
summary(output)
datashare <- which(sapply(output, FUN=function(X) "datasharing" %in% X))
datashare
list(output[[19]]$name, output[[19]]$created_at)

#For हटमळ पृष्ठ
 library(XML)
doc<-htmlParse('http://biostat.jhsph.edu/~jleek/contact.html',useInternalNodes = TRUE)
summary(doc)
linebyline<- readLines('http://biostat.jhsph.edu/~jleek/contact.html')
summary(linebyline)
nchar(linebyline[10])  
nchar(linebyline[20])
nchar(linebyline[30])
nchar(linebyline[100])


##Qestion of .FOR type file

download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for',destfile = './data/for.FOR',mode = 'wb')
date()
library(data.table)
f=fread('data/for.FOR',sep = ' - ')
?fread
read.table(f)
summary(f)
required=sapply(f[,4], function(x){as.numeric(x)})
sum(required,na.rm = TRUE)
class(r)
summary(r)
