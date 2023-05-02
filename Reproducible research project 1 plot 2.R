fileurl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"

download.file(fileurl,destfile = "./repdata_data_activity.zip",method = "curl")

unzip("repdata_data_activity.zip")

activitydata <- read.csv("activity.csv")

Intervalsteps <- aggregate(steps ~ interval,activitydata,mean,na.rm = TRUE)

plot(steps ~ interval,data = Intervalsteps)

maxintervalstep <- Intervalsteps[which.max(Intervalsteps$steps),]$interval

## Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

## The interval with the most steps is 835th interval
