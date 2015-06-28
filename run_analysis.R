library(plyr)

# Merges the training and the test sets to create one data set.

x_train = read.table("train/X_train.txt")
y_train = read.table("train/y_train.txt")
subject_train = read.table("train/subject_train.txt")

x_test = read.table("test/X_test.txt")
y_test = read.table("test/y_test.txt")
subject_test = read.table("test/subject_test.txt")

x_data = rbind(x_train, x_test)
y_data = rbind(y_train, y_test)
subject_data = rbind(subject_train, subject_test)

#Extracts only the measurements on the mean and standard deviation for each measurement. 

features = read.table("features.txt")
mean_and_std = grep("-(mean|std)\\(\\)", features[, 2])
x_data = x_data[, mean_and_std]
names(x_data) = gsub("\\(|\\)", "", tolower(features[mean_and_std, 2]))

#Uses descriptive activity names to name the activities in the data set

activity = read.table("activity_labels.txt")
activity[,2] = gsub("_", "", tolower(activity[,2]))
y_data[,1] = activity[y_data[,1], 2]
names(y_data) <- "activity"

#Appropriately labels the data set with descriptive variable names. 

names(subject_data) <- "subject"
all_data = cbind(x_data, y_data, subject_data)
write.table(all_data, "merged_all_data.txt")

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

averages_data <- ddply(all_data, .(subject, activity), function(x) { colMeans(x[, 1:66]) } )
write.table(averages_data, "averages_data.txt", row.name=FALSE)

