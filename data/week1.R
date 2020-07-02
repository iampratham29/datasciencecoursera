download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv',
              'C:/Users/Prathmesh/Desktop/grishma/munga.csv')

munga<-read.csv('C:/Users/Prathmesh/Desktop/grishma/munga.csv')

head(munga)

#subset.data.frame(munga,VAL>=1000000) wrong

nrow(subset.data.frame(munga,VAL==24))
q2<-munga$FES
q2

install.packages("xlsx")
library('xlsx')

if(!file.exists('data')){dir.create('data')}

fileUrl<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'

download.file(fileUrl,'data/dat.xlsx',mode = 'wb')

dat<-read.xlsx('./data/dat.xlsx',sheetIndex = 1,
               rowIndex = 18:23,
               colIndex = 7:15,
               header = TRUE)

head(dat)
sum(dat$Zip*dat$Ext,na.rm=T)

#reading XML docs
install.packages("XML")

library(XML)
xmlUrl<-'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
doc<- xmlTreeParse(xmlUrl,useInternalNodes = TRUE)
rootNode<- xmlRoot(doc)
names(rootNode)
rootNode
sum(xpathSApply(rootNode,'//zipcode',xmlValue)==21231)
rootNode[[1]][[1]]
p<-xmlToDataFrame(rootNode)
head(p)

dlink<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
download.file(dlink,'./data/DT.csv','curl')
DT<-fread('./data/DT.csv') #Error occurs
install.packages("data.table")
library(data.table)
DT<-fread('./data/DT.csv')
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT[DT$SEX==1,]$pwgtp15))


