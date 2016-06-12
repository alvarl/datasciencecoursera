setwd("~/Downloads/UCI HAR Dataset")

# read in the files, merging test and training data
readings <-   rbind(read.table("test/X_test.txt"),       read.table("train/X_train.txt"))
activities <- rbind(read.table("test/y_test.txt"),       read.table("train/y_train.txt"))
subjects <-   rbind(read.table("test/subject_test.txt"), read.table("train/subject_train.txt"))
activityLabels <- read.table("activity_labels.txt")

# read in the feature labels, omitting codes
featureLabels <- read.table("features.txt", stringsAsFactors = FALSE)[,2]

# map activity labels to codes
names(activities) <- "activityCode"
names(activityLabels) <- c("activityCode", "activityLabel")
activities <- merge(activities, activityLabels)

# bind subject and activity data to readings 
readings <- cbind(readings, activities)
readings <- cbind(readings, subjects)

# set names to readings
names(readings) <- append(featureLabels, c("activityCode", "activityLabel", "subject"))

# filter out anything but standard deviation and mean columns, activity labels and subject codes
neededCols <- sapply(names(readings), function(name) 
  grepl("std", name) || (grepl("mean", name) && !grepl("meanFreq", name)) || name %in% c("activityLabel", "subject")
)
meanAndStdReadings <- readings[, neededCols]

# Aggregated averages by activity and subject
aggReadings <- aggregate(meanAndStdReadings[,!names(meanAndStdReadings) %in% c("activityLabel", "subject")], 
                         meanAndStdReadings[,names(meanAndStdReadings) %in% c("activityLabel", "subject")], FUN = mean)





