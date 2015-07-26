Course Project Code Book
========================

Data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) cleans up the data with the following steps:

* Merges the training and test sets to create one data set. Training data has 7352 objects (rows) & Test data has 2947 objects (rows). Combined data has 10299 objects. Use rbind() to combine the corresponding training and test datasets. 

* Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. The datasets contains 6 activities: (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). There are 561-feature vector with time and frequency domain variables of activities described in the features.txt file. To select ???mean??? and ???std ???, use grep() to extract.

* Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:

        walking
        
        walkingupstairs
        
        walkingdownstairs
        
        sitting
        
        standing
        
        laying

* The R script also appropriately labels the data set with descriptive names: all feature names (columns) and activity names are converted to lower case; with brackets "()" and underscores are removed. Then the code merges the 10299x66 data frame containing features with 10299x1 data frames consists the activity labels and subject IDs. The result is saved as merged_clean_data.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. Subject IDs are up to 30 only. 

* Finally, the R script creates a second, independent tidy data set with the average of each variable for each activity and each subject. The result is saved as cleandat_average.txt, a 180x68 data frame. There are 30 subjects and 6 activities, thus in total there are 180 rows in this newly created data set with their averages.
