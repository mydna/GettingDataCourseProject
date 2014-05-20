# Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# This R script requires that the data be located in the working directory when running this script. 
# First, this script merges the training and the test sets to create one data set.
# Second, it extracts only the measurements on the mean and standard deviation for each measurement. 
# Then, it uses descriptive activity names to name the activities in the data set.
# Then, it appropriately labels the data set with descriptive activity names. 
# Then, it creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

xtrain <- read.table("train/X_train.txt")
xtest <- read.table("test/X_test.txt")
ytrain <- read.table("train/y_train.txt")
ytest <- read.table("test/y_test.txt")
subtrain <- read.table("train/subject_train.txt")
subtest <- read.table("test/subject_test.txt")
X <- rbind(xtrain, xtest)
Y <- rbind(ytrain, ytest)
subject <- rbind(subtrain, subtest)

featureset <- read.table("features.txt")
mean_std <- grep("-mean\\(\\)|-std\\(\\)", featureset[, 2])
X <- X[, mean_std]
varnames <- featureset[mean_std, 2]
names(X) <- gsub("-",".",tolower(gsub("\\(|\\)", "",varnames)))

activitylabels <- read.table("activity_labels.txt")
activitylabels[ ,2] <- tolower(as.character(activitylabels[ ,2]))
activitylabels[, 2] <- gsub("_", "", activitylabels[, 2])
Y[,1] = activitylabels[Y[,1], 2]

names(Y) <- "activity"
names(subject) <- "subject"
tidydata1 <- cbind(subject, Y, X)
write.table(tidydata1, "merged_tidy_data.txt", sep="\t",row.names=FALSE)

nColumns = dim(tidydata1)[2]
nActivities = length(activitylabels[,1])
DistSubjects = unique(subject)[,1]
nDistSubjects = length(unique(subject)[,1])
tidydata2 = tidydata1[1:(nDistSubjects*nActivities), ]

temp = 1
for (a in 1:nDistSubjects) {
  for (b in 1:nActivities) {
    forAverages <- tidydata1[tidydata1$subject==a & tidydata1$activity==activitylabels[b, 2], ]
    tidydata2[temp, 1] = DistSubjects[a]
    tidydata2[temp, 2] = activitylabels[b, 2]
    tidydata2[temp, 3:nColumns] <- colMeans(forAverages[, 3:nColumns])
    temp= temp + 1
  }
}

write.table(tidydata2, "tidy_dataset_2_with_averages.txt",sep="\t",row.names=FALSE)
