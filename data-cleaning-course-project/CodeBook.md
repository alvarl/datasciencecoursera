# Data processing

The packaged dataset was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unpacked to local hard drive. 

The script `run_analysis.R` is used to process the files. 

The script executes the following steps:

1. Sets the working directory containing the unpacked dataset
2. Loads the measurements, activity codes and subject codes, merging together test and training datasets. Main readings are stored in `readings`
3. Loads the activity labels
4. Loads the feature labels, omitting the codes
5. Maps activity labels to activity codes
6. Adds activity and subject information to the main `readings` dataset
7. Adds feature labels as columns to `readings` and labels activity and subject columns
8. Creates a dataset named `meanAndStdReadings` that only contains features with "std" or "mean" in there names, but not "meanFreq". Activity and subject columns are also included. This is the first of the expected outputs. 
9. Calculates the mean for all features, aggregated by activity and subject. The result is stored in `meanAndStdReadings`. This is the second of the expected outputs. 

# Variables containing the desired output

`meanAndStdReadings` - mean and standard deviation readings for all the measurements, together with subject and activity information in columns `activityLabel` and `subject`

`aggReadings` - aggregated mean over all readings by activity and subject