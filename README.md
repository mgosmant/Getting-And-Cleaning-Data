#Run_analysis
The following R script is written to allow performing data transformation and summarization on Human Activity Recognition Using Smartphones Dataset

The following procedures were performed:

1- Merges the training and the test sets to create one data set.
2- Extracts only the measurements on the mean and standard deviation for each measurement.
3- Uses descriptive activity names to name the activities in the data set.
4- Appropriately labels the data set with descriptive variable names.
5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Code book session

In the generated tidy data set, the large table contains the following columns, the meaning of column names are explained as below:

subject indicates the identifier of the subject who carried out the experiment.
activity_name labels the name of performed experiments, belonging to categorical variables.
The following 79 columns indicates the 79 feature variables, shown as the average of each measured feature for each subject and each activity. For each feature variable, they are measured in the time and frequency domains, respectively, as indicated by 't' or 'f' prefix. The estimation used in this data set is either mean() (Mean value) or std() (Standard deviation). '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions, respectively.

In the resulting tidy data set, each row indicates the unique combination of each subject and each activity.
