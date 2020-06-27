#setting path to extracted folder
a<-getwd()
path<-paste(a,"/week 4/rprog_data_ProgAssignment3-data/",sep='')
a
#setting working directory to acquired path
setwd(path)
outcome<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

summary(outcome)

#Plotting Hospital 30-Day Death (Mortality) Rates from Heart Attack which is at
#column 11

outcome[,11]<- as.numeric(outcome[,11])
hist(outcome[,11])

best<-function(state,outcomes){
  if(isFALSE(any(outcome$State==state))){
    stop("invalid state")
  }
  else{
  
  if(outcomes=="heart attack"){
    subb<-subset.data.frame(outcome,State==state,select=c(Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
    subb_death<-na.omit((subb[,2]))
    res<-subset(subb,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack==min(subb_death))
    
    
    }
  else if(outcomes=="heart failure"){
    subb<-subset.data.frame(outcome,State==state,select=c(Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
    subb_death<-na.omit(as.numeric(subb[,2]))
    res<-subset(subb,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure==min(subb_death))
  }
  else if(outcomes=="pneumonia"){
    subb<-subset.data.frame(outcome,State==state,select=c(Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
    subb_death<-na.omit(as.numeric(subb[,2]))
    res<-subset(subb,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia==min(subb_death))
  }
  else{
    stop("invalid outcome")
  }
    
  sorted_res<-with(res, res[order(Hospital.Name) , ])
  as.character(head(sorted_res,1)[1])
  }
}
best("TX","heart attack")
best("TX", "heart failure")
best("MD", "heart attack") 
best("MD", "pneumonia")



rankhospital<- function(state, outcome, num = "best")
{
  outcome1 <- read.csv("outcome-of-care-measures.csv",
                       colClasses = "character")
  if(!any(state == outcome1$State)){
    stop("invalid state")}
  else if((outcome %in% c("heart attack", "heart failure",
                          "pneumonia")) == FALSE) {
    stop(print("invalid outcome"))
  }
  outcome2 <- subset(outcome1, State == state)
  if (outcome == "heart attack") {
    colnum <- 11
  }
  else if (outcome == "heart failure") {
    colnum <- 17
  }
  else {
    colnum <- 23
  }
  outcome2[ ,colnum] <- as.numeric(outcome2[ ,colnum])
  outcome3 <- outcome2[order(outcome2[ ,colnum],outcome2[,2]), ]
  outcome3 <- outcome3[(!is.na(outcome3[ ,colnum])),]
  if(num == "best"){
    num <- 1
  }            
  else if (num == "worst"){
    num <- nrow(outcome3)
  }      
  return(outcome3[num,2])
}


rankall<- function(outcome, num = "best")
{
  library(dplyr)
  library(magrittr)
  outcome2 <- read.csv("outcome-of-care-measures.csv",
                       colClasses = "character")
  if((outcome %in% c("heart attack", "heart failure",
                     "pneumonia")) == FALSE) {
    stop(print("invalid outcome"))
  }
  if (outcome == "heart attack") {
    colnum <- 11
  }
  else if (outcome == "heart failure") {
    colnum <- 17
  }
  else {
    colnum <- 23
  }
  outcome2[ ,colnum] <- as.numeric(outcome2[ ,colnum])
  
  outcome2 = outcome2[!is.na(outcome2[,colnum]),]
  
  splited = split(outcome2, outcome2$State)
  ans = lapply(splited, function(x, num) {
    x = x[order(x[,colnum], x$Hospital.Name),]
    
    if(class(num) == "character") {
      if(num == "best") {
        return (x$Hospital.Name[1])
      }
      else if(num == "worst") {
        return (x$Hospital.Name[nrow(x)])
      }
    }
    else {
      return (x$Hospital.Name[num])
    }
  }, num)
  
  #Return data.frame with format
  return ( data.frame(hospital=unlist(ans), state=names(ans)) )
}


# example output:
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)


