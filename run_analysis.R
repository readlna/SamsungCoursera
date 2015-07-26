rm(list=ls())
# ----- reading TEST datasets
      # Inertial signals
            # body acceleration signal obtained by subtracting the gravity from the total acceleration
body_acc_x_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", 
                             sep="", 
                             na.strings = "NA")
body_acc_y_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", 
                            sep="", 
                            na.strings = "NA")
body_acc_z_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", 
                            sep="", 
                            na.strings = "NA")
            # angular velocity vector measured by the gyroscope for each window sample. 
            # The units are radians/second. 
body_gyro_x_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", 
                            sep="", 
                            na.strings = "NA")
body_gyro_y_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", 
                            sep="", 
                            na.strings = "NA")
body_gyro_z_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", 
                            sep="", 
                            na.strings = "NA")
            # acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'
total_acc_x_test<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", 
                            sep="", 
                            na.strings = "NA")
total_acc_y_test<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", 
                            sep="", 
                            na.strings = "NA")
total_acc_z_test<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", 
                            sep="", 
                            na.strings = "NA")
      
      # subject who performed the activity for each window sample
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt", 
                         sep=" ", 
                         na.strings = "NA")
     
       # test labels
y_test<-read.table("UCI HAR Dataset/test/y_test.txt", 
                   sep=" ", 
                   na.strings = "NA")
      
      # test set
x_test<-read.table("UCI HAR Dataset/test/X_test.txt", 
                   sep="", 
                   na.strings = "NA")

# ----- reading TRAIN datasets

      # Inertial signals
            # body acceleration signal obtained by subtracting the gravity from the total acceleration
body_acc_x_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", 
                            sep="", 
                            na.strings = "NA")
body_acc_y_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", 
                            sep="", 
                            na.strings = "NA")
body_acc_z_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", 
                            sep="", 
                            na.strings = "NA")
            # angular velocity vector measured by the gyroscope for each window sample. 
            # The units are radians/second. 
body_gyro_x_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", 
                             sep="", 
                             na.strings = "NA")
body_gyro_y_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", 
                             sep="", 
                             na.strings = "NA")
body_gyro_z_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", 
                             sep="", 
                             na.strings = "NA")
            # acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'
total_acc_x_train<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", 
                             sep="", 
                             na.strings = "NA")
total_acc_y_train<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", 
                             sep="", 
                             na.strings = "NA")
total_acc_z_train<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", 
                             sep="", 
                             na.strings = "NA")

      # subject who performed the activity for each window sample
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt", 
                         sep=" ", 
                         na.strings = "NA")

      # train labels
y_train<-read.table("UCI HAR Dataset/train/y_train.txt", 
                   sep=" ", 
                   na.strings = "NA")

      # train set
x_train<-read.table("UCI HAR Dataset/train/X_train.txt", 
                   sep="", 
                   na.strings = "NA")

# activity labels
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt", 
                    sep=" ", 
                    na.strings = "NA")

# features
features<-read.table("UCI HAR Dataset/features.txt", 
                     sep=" ", 
                     na.strings = "NA")

# --------- 1. merge test and train sets
      # inertial signals
body_acc_x<-rbind(body_acc_x_train, body_acc_x_test)
body_acc_y<-rbind(body_acc_y_train, body_acc_y_test)
body_acc_z<-rbind(body_acc_z_train, body_acc_z_test)
body_gyro_x<-rbind(body_gyro_x_train, body_gyro_x_test)
body_gyro_y<-rbind(body_gyro_y_train, body_gyro_y_test)
body_gyro_z<-rbind(body_gyro_z_train, body_gyro_z_test)
total_acc_x<-rbind(total_acc_x_train, total_acc_x_test)
total_acc_y<-rbind(total_acc_y_train, total_acc_y_test)
total_acc_z<-rbind(total_acc_z_train, total_acc_z_test)
      # subjects
subject<-rbind(subject_train, subject_test)
      # x
x<-rbind(x_train, x_test)
      # y
y<-rbind(y_train, y_test)
      
# -----------3. Uses descriptive activity names to name the activities in the data set

# adding header to data set
head(features)
names<-features[1:561,2]
colnames(x)<-names
head(x)

# adding header to subject
colnames(subject)<-c("subjectLabel")

# adding subjectLabel column to data set
x<-cbind(subject,x)

# ------------4. Appropriately labels the data set with descriptive variable names. 
# adding activity labels
x<-cbind(y, x)
colnames(activity_labels)<-c("id", "activity")
x<-merge(x, activity_labels, by.x="V1", by.y = "id")
x<-x[,2:length(x)]

# ------------2. Extracts only the measurements on the mean and standard deviation for each measurement. 
x$activity<-as.character(x$activity)
ext<-cbind(x[,1:7],
      cbind(x[,42:47],
      cbind(x[,82:87],
      cbind(x[,122:127],
      cbind(x[,162:167],
      cbind(x[,202:203],
      cbind(x[,215:216],
      cbind(x[,228:229],
      cbind(x[,241:242],
      cbind(x[,254:255],
      cbind(x[,267:272],
      cbind(x[,346:351],
      cbind(x[,425:430],
      cbind(x[,504:505],
      cbind(x[,517:518],
      cbind(x[,530:531],
      cbind(x[,543:544],
      cbind(x[,563:563]))))))))))))))))))
colnames(ext)[68]<-"activity"

# ------------ 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
means<-aggregate(ext, by = list(ext$subject, ext$activity), FUN = "mean")
means<-means[,2:69]
colnames(means)[1]<-"activity"

# export means data table to a textfile
write.table(means, "averages.txt", row.names = FALSE)
