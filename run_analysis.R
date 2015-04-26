download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "meter.zip")
unzip("meter.zip")

#assembly of proper variable names
labels <- read.table("UCI HAR Dataset/features.txt")
labels[,2] <- sub("^t","time",labels[,2]) 
labels[,2] <- sub("^f", "frequency", labels[,2]) 
labels[,2] <-  gsub("-(\\w)(\\w*)", "\\U\\1\\L\\2", labels[,2], perl = T) 
labels[,2] <- gsub ("angle\\(t", "angleOfTime", labels[,2])
labels[,2] <- gsub ("angle\\(", "angleOf", labels[,2])
labels[,2] <- gsub (",", "And", labels[,2])
labels[,2] <- gsub ("\\(\\)", "", labels[,2])
labels[,2] <- gsub ("Acc", "Acceleration",labels[,2])
labels[,2] <- gsub ("\\)", "", labels[,2])

#reading sets
train1 <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = labels[,2])
train2 <- read.table("UCI HAR Dataset/train/Y_train.txt")
train3 <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainFull <- cbind(train3,train2,train1)

test1 <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = labels[,2])
test2 <- read.table("UCI HAR Dataset/test/Y_test.txt")
test3 <- read.table("UCI HAR Dataset/test/subject_test.txt")
testFull <- cbind(test3,test2, test1)

#combining training and test sets
data <- rbind(trainFull, testFull)

#renaming
data[2] <- factor(data[,2], labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
names(data)[1:2] <- c("Subject" ,"Activity")

#arrange by subject
library(plyr)
library(dplyr)
data <- arrange(data,Subject)

#getting mean and std
ndata <- data[grepl("Subject|Activity|Mean|Std", colnames(data))]

#new data set with average by activity and subject
cols <- (lapply(c("Subject","Activity"), as.symbol))
actData <-ndata  %>% group_by_(.dots=cols) %>% summarise_each(funs(round(mean(.),3)))

#tidy.txt
write.table(actData, file = "tidy.txt", row.names=F)
