# Creating "test" data frame
xtest<- read.table("./UCI HAR Dataset/test/X_test.txt")
subjecttest<- read.table("./UCI HAR Dataset/test/subject_test.txt")
ytest<- read.table("./UCI HAR Dataset/test/y_test.txt")
features<- read.table("./UCI HAR Dataset/features.txt")
test<- xtest
names(test)<- features[,2]
names(subjecttest)<- "Subject"
test<- cbind(subjecttest, test)
names(ytest)<- "Activity"
test<- cbind(test, ytest)
# Creating "train" data frame
xtrain<- read.table("./UCI HAR Dataset/train/X_train.txt")
subjecttrain<- read.table("./UCI HAR Dataset/train/subject_train.txt")
ytrain<- read.table("./UCI HAR Dataset/train/y_train.txt")
train<- xtrain
names(train)<- features[,2]
names(subjecttrain)<- "Subject"
train<- cbind(subjecttrain, train)
names(ytrain)<- "Activity"
train<- cbind(train, ytrain)
# Creating the complete data frame using "test" and "train" data frames
data<- rbind(test, train)

# Extracting mean and standard deviation measurments 
means_stds<- grep("mean\\(\\)|std\\(\\)", names(data))
data1<- data[,means_stds]
data1<- cbind(Subject=data[,1], data1, Activity=data[,ncol(data)])

# Naming the activities in the data set
data1$Activity<- sub("1", "WALKING", data1$Activity)
data1$Activity<- sub("2", "WALKING_UPSTAIRS", data1$Activity)
data1$Activity<- sub("3", "WALKING_DOWNSTAIRS", data1$Activity)
data1$Activity<- sub("4", "SITTING", data1$Activity)
data1$Activity<- sub("5", "STANDING", data1$Activity)
data1$Activity<- sub("6", "LAYING", data1$Activity)

# Labling the data set with descriptive variable names
names(data1)<- sub("^t", "time", names(data1))
names(data1)<- sub("Acc", "Accelerometer", names(data1))
names(data1)<- sub("Gyro", "Gyroscope", names(data1))
names(data1)<- sub("f", "frequency", names(data1))
names(data1)<- sub("Mag", "Magnitude", names(data1))
names(data1)<- sub("BodyBody", "Body", names(data1))

# Creating a tidy data set with the average of each variable for each activity and each subject
DATA<-aggregate(. ~ Subject + Activity, data1, mean)
DATA<-DATA[order(DATA$Subject,DATA$Activity),]
write.table(DATA, file = "TidyData.txt",row.name=FALSE)






