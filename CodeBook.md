# Operations of the R script


The script run_analysis.R does the 5 steps, which are described in comments.

# Steps 

At first, we need to merge data using the rbind() function. We use merging only for data sets, which have same number of columns and same objects in it.
Secondly, we are giving the correct names (from features.txt) to only those columns, which have the mean
and standard deviation measures.
To change the activity data(values 1:6), we replace it with the activity names and IDs from activity_labels.txt.
Also we correct columns with messy and undescriptive names.
Finally, a new dataset with all the average measures for each subject and each activity type is generated and uploaded as averages_data.txt.

# Labels
x_train, y_train, x_test, y_test, subject_train and subject_test consist of the data from the files.
In x_data_set, y_data_set and subject_data_set we merging previoulsy mentioned sets.
features gives us the names for the x_data_set, which are corretions to the column names stored in mean_and_std.

final_data_set merges all sets in one.
aver_data_set contains the needed averages which will be later in a .txt file.
