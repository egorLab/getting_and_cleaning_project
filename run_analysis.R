library(plyr)




# First step
# We are creating one dataset by merging test and train sets



x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")



x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")


# So now we can create common data sets with rbind

x_data_set <- rbind(x_train, x_test)
y_data_set <- rbind(y_train, y_test)
subject_data_set <- rbind(subject_train, subject_test)


# Second step
# Extracting only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")

# Taking only mean and std data with regular expression from second column of features

mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

# Re-writing x_data_set with subsetting needed columns and changing the column names. 

x_data_set <- x_data_set[, mean_and_std]

names(x_data_set) <- features[mean_and_std, 2]

# Third step
# Use descriptive activity names to name the activities in the data set.



activities <- read.table("activity_labels.txt")
y_data_set[, 1] <- activities[y_data_set[, 1], 2] # changing descriptions in y_data_set values

names(y_data_set) <- "Activity"



# Fourth step
# Appropriately labels the data set with descriptive variable names.



names(subject_data_set) <- "Subject"

# Changing column names for better


for (i in 1:length(colnames(final_data_set))) 
  + {
    +     colnames(final_data_set)[i] = gsub("\\()","",colnames(final_data_set)[i])
    +     colnames(final_data_set)[i] = gsub("-std$","StdDev",colnames(final_data_set)[i])
    +     colnames(final_data_set)[i] = gsub("-mean","Mean",colnames(final_data_set)[i])
    +     colnames(final_data_set)[i] = gsub("^(t)","Time",colnames(final_data_set)[i])
    +     colnames(final_data_set)[i] = gsub("^(f)","Freq",colnames(final_data_set)[i])
    +     colnames(final_data_set)[i] = gsub("([Gg]ravity)","Gravity",colnames(final_data_set)[i])
    +     colnames(final_data_set)[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colnames(final_data_set)[i])
    +     colnames(final_data_set)[i] = gsub("[Gg]yro","Gyro",colnames(final_data_set)[i])
    +     colnames(final_data_set)[i] = gsub("AccMag","AccMagnitude",colnames(final_data_set)[i])
    +     colnames(final_data_set)[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colnames(final_data_set)[i])
    +     colnames(final_data_set)[i] = gsub("JerkMag","JerkMagnitude",colnames(final_data_set)[i])
    +     colnames(final_data_set)[i] = gsub("GyroMag","GyroMagnitude",colnames(final_data_set)[i])}

# Fifth step
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Creating a data set by ddply, averaging columns' variables

aver_data_set <- ddply(final_data_set, .(Subject, Activity), function(x) colMeans(x[, 1:66]))

write.table(aver_data_set, "averages_data_set.txt", row.name=FALSE)

