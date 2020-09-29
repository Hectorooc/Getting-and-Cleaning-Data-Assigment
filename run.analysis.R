# Loading the dplyr package into R, this allows for table manipulation functions

  library(dplyr)
  
# Getting all the .txt files into R (using the headers in the txt's as column names)
  
    features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
    activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
    x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
    y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
    x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
    y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
    
 # Using R bind we combine the data sets by the rows(both for values in x and y as well as subject) 
 # Both newly created tables are then binded by column to create just one table
    
    X_Table <- rbind(x_train, x_test)
    Y_Table <- rbind(y_train, y_test)
    Subject_Table <- rbind(subject_train, subject_test)
    Master_Table <- cbind(Subject_Table, Y_Table, X_Table)
    
 # Creating a Table which contains only the mean, subject and standard deviation 
    #for each code in the data set
  
  Tidy_Table <- Master_Table %>% select(subject, code, contains("mean"), contains("std"))
  
  #Setting the activities as well as using gsub() function to substitute the terms into more comprehensible names on the labels
  Tidy_Table$code <- activities[Tidy_Table$code, 2]
  
  names(Tidy_Table)[2] = "activity"
  names(Tidy_Table)<-gsub("Acc", "Accelerometer", names(Tidy_Table))
  names(Tidy_Table)<-gsub("Gyro", "Gyroscope", names(Tidy_Table))
  names(Tidy_Table)<-gsub("BodyBody", "Body", names(Tidy_Table))
  names(Tidy_Table)<-gsub("Mag", "Magnitude", names(Tidy_Table))
  names(Tidy_Table)<-gsub("^t", "Time", names(Tidy_Table))
  names(Tidy_Table)<-gsub("^f", "Frequency", names(Tidy_Table))
  names(Tidy_Table)<-gsub("tBody", "TimeBody", names(Tidy_Table))
  names(Tidy_Table)<-gsub("-mean()", "Mean", names(Tidy_Table), ignore.case = TRUE)
  names(Tidy_Table)<-gsub("-std()", "STD", names(Tidy_Table), ignore.case = TRUE)
  names(Tidy_Table)<-gsub("-freq()", "Frequency", names(Tidy_Table), ignore.case = TRUE)
  names(Tidy_Table)<-gsub("angle", "Angle", names(Tidy_Table))
  names(Tidy_Table)<-gsub("gravity", "Gravity", names(Tidy_Table))
  
  #Creating the final table with the values for STD and Mean gruped by the activity
  
  FinalTable <- Tidy_Table %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
  write.table(FinalTable, "FinalTable.txt", row.name=FALSE)
  