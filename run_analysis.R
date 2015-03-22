# Loads and Merges the training and the test sets to create one data set
# The raw files were downloaded in a single folder "UCI HAR Dataset" under current working directory
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

subject_text <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

subjects <- rbind(subject_text, subject_train)
labels <- rbind(y_test, y_train)
labels <- merge(labels, activity_labels, by=1)[,2]

allData <- rbind(x_test, x_train)
colnames(allData)<-features[,2]

# Extracts only the measurements on the mean and standard deviation for each measurement. 
grepData <- allData[,grep("mean()|std()", names(allData))]

# Uses descriptive activity names to name the activities in the data set
allData <- cbind(subjects, labels, grepData)

# Appropriately labels the data set with descriptive variable names. 
colnames(allData)[c(1,2)]<-c("subject", "activity_name")

#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata_mean<-aggregate(.~subject + activity_name, data=allData, mean)
write.table(tidydata_mean, file="UCI HAR Dataset/tidydata.txt", quote=F, sep="\t", row.names=F, col.names=T)
