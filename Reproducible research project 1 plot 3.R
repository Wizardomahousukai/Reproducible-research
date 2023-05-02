fileurl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"

download.file(fileurl,destfile = "./repdata_data_activity.zip",method = "curl")

unzip("repdata_data_activity.zip")

activitydata <- read.csv("activity.csv")

Totalstepsinadaynanotremoved <- aggregate(steps ~ date, activitydata,sum,na.rm = FALSE)

hist(Totalstepsinadaynanotremoved $steps)

mean(Totalstepsinadaynanotremoved$steps)

median(Totalstepsinadaynanotremoved$steps)

# Mean no of steps per day with missing values is 10766.19
# Median no of steps per day with missing values is 10765