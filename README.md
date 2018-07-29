# Getting-and-Cleaning-Data-Course-Project
This is the course project of the Getting and Cleaning Data course. The run_analysis.R script does the following:
    
	1. Takes all the data from "UCI HAR Dataset" folder in your working directory
	
    	2. Creates two data frames called "test" and "train"
    
	3. Merges the "train" and the "test" data frames to create one data frame called "data".
    
	4. From the recent data frame extracts only the measurements on the mean and standard deviation for each measurement, and also 		changes the variable names to descriptive names and store these data in "data1" data frame.
        
	5. Creates another tidy data frame with the average of each variable for each activity and each subject. 
	
The result data set is stored in the TidyData.txt file.
