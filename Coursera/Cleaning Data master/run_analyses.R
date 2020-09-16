run_analyses <- function(){
  # Cristian Neuhaus
  ## Previous Activity - Set yout Working Directory in the same path where data are
  ## 
  ## Reading variables's name and data
  features <- read.table("features.txt", col.names = c("n", "function_names"))
  activities <- read.table("activity_labels.txt", col.names = c("code", "activity_descripion"))
  test_subj <- read.table("./test/subject_test.txt", col.names = "subject")
  train_subj <- read.table("./train/subject_train.txt", col.names = "subject")
  test_x <- read.table("./test/X_test.txt", col.names = features$function_names)
  test_y <- read.table("./test/Y_test.txt", col.names = "code")
  train_x <- read.table("./train/X_train.txt", col.names = features$function_names)
  train_y <- read.table("./train/Y_train.txt", col.names = "code")
  #
  ## 1. Merges the training and the test sets to create one data set called as merge_data.
  #
  merge_x <- rbind(train_x,test_x)
  merge_y <- rbind(train_y,test_y)
  merge_subj <- rbind(train_subj,test_subj)
  merge_data <- cbind(merge_subj, merge_y, merge_x)
  #
  ## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  #
  library(dplyr)
  #mean_std_data <- merge_data %>% select(subject, code, contains("mean"), contains("std"))
  #mean_std_data <- select(merge_data, contains("mean"), contains("std"))
  mean_std_data <- select(merge_data, subject, code, contains("mean"), contains("std"))
  #
  # 3. Uses descriptive activity names to name the activities in the data set
  #    update collum "code" to the right name of activities
  #
  mean_std_data$code <- activities[mean_std_data$code, 2]
  #
  ## 4. Appropriately labels the data set with descriptive variable names.
  #     take a look on "egitingTextVariable" material from cleaning data
  #
  names(mean_std_data)[2] = "activity" #replace code by activity
  names(mean_std_data)<-gsub("Acc", "Accelerometer", names(mean_std_data)) #replace Acc by Accelerometer
  names(mean_std_data)<-gsub("Gyro", "Gyroscope", names(mean_std_data))
  names(mean_std_data)<-gsub("BodyBody", "Body", names(mean_std_data))
  names(mean_std_data)<-gsub("Mag", "Magnitude", names(mean_std_data))
  names(mean_std_data)<-gsub("^t", "Time", names(mean_std_data))
  names(mean_std_data)<-gsub("^f", "Frequency", names(mean_std_data))
  names(mean_std_data)<-gsub("tBody", "TimeBody", names(mean_std_data))
  names(mean_std_data)<-gsub("-mean()", "Mean", names(mean_std_data), ignore.case = TRUE)
  names(mean_std_data)<-gsub("-std()", "STD", names(mean_std_data), ignore.case = TRUE)
  names(mean_std_data)<-gsub("-freq()", "Frequency", names(mean_std_data), ignore.case = TRUE)
  names(mean_std_data)<-gsub("angle", "Angle", names(mean_std_data))
  names(mean_std_data)<-gsub("gravity", "Gravity", names(mean_std_data))
  #
  ## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  #
  result <- mean_std_data %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
  write.table(result, "Peer-Graded-Cleaning Data.txt", row.name=FALSE)
}
# Coursera_Getting-and-Cleaning-Data-Course-Poject
