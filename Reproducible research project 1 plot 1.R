fileurl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"

download.file(fileurl,destfile = "./repdata_data_activity.zip",method = "curl")

unzip("repdata_data_activity.zip")

activitydata <- read.csv("activity.csv")

Totalstepsinaday <- aggregate(steps ~ date, activitydata,sum,na.rm = TRUE)

hist(Totalstepsinaday$steps)

mean(Totalstepsinaday$steps)

median(Totalstepsinaday$steps)

## What is mean total number of steps taken per day?
## Answer: 10766.19

## What is mean total number of steps taken per day?
## Answer: 10765
