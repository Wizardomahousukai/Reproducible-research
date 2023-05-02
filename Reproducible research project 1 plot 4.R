fileurl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"

download.file(fileurl,destfile = "./repdata_data_activity.zip",method = "curl")

unzip("repdata_data_activity.zip")

activitydata <- read.csv("activity.csv")

Totalstepsinaday <- aggregate(steps ~ date, activitydata,sum,na.rm = TRUE)

Totalstepsinadaynanotremoved <- aggregate(steps ~ date, activitydata,sum,na.rm = FALSE)

Totalmeanstepsinaday <- aggregate(steps ~ date, activitydata,mean,na.rm = TRUE)

missingcolumnvalue <-is.na(activitydata[,1])


m <- mean(Totalmeanstepsinaday$steps)

activityday <- activitydata
activityday[missingcolumnvalue,1]<-m
head(activityday)

activityday$date<-as.Date(activityday$date)

activityweek <-activityday%>%
  mutate(dayType= ifelse(weekdays(activityday$date)=="Saturday" | weekdays(activityday$date)=="Sunday", "Weekend", "Weekday"))
head(activityweek)

averageStepintervalandday<-activityweek %>%
  group_by(dayType, interval) %>%
  summarize(Totalstepsinaday=sum(steps))

head(averageStepintervalandday)

daytypePlot <- ggplot(averageStepintervalandday, aes(x = interval , y = Totalstepsinaday, color = dayType)) + geom_line() + ggtitle("Average Daily Steps by Day Type")

# There is noticably higher footsteps on weekdays compared to weekends. This suggests that people stay at home to 
# rest instead of going out whereas there is more activity on weekdays due to work