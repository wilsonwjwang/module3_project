# Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# This R script does the following:

# 1. Merges the training and the test sets to create one data set.

x1 <- read.table("train/X_train.txt")
x2 <- read.table("test/X_test.txt")
x <- rbind(x1, x2)

sub1 <- read.table("train/subject_train.txt")
sub2 <- read.table("test/subject_test.txt")
sub <- rbind(sub1, sub2)

y1 <- read.table("train/y_train.txt")
y2 <- read.table("test/y_test.txt")
y <- rbind(y1, y2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
mesr <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x <- x[, mesr]
names(x) <- features[mesr, 2]
names(x) <- gsub("\\(|\\)", "", names(x))
names(x) <- tolower(names(x))

# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
y[,1] = activities[y[,1], 2]
names(y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(sub) <- "subject"
cleandat <- cbind(sub, y, x)
write.table(cleandat, "merged_clean_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniquesub = unique(sub)[,1]
numsub = length(unique(sub)[,1])
numact = length(activities[,1])
numcols = dim(cleandat)[2]
result = cleandat[1:(numsub*numact), ]

row = 1
for (sub in 1:numsub) {
    for (a in 1:numact) {
        result[row, 1] = uniquesub[sub]
        result[row, 2] = activities[a, 2]
        workarea <- cleandat[cleandat$subject==sub & cleandat$activity==activities[a, 2], ]
        result[row, 3:numcols] <- colMeans(workarea[, 3:numcols])
        row = row+1
    }
}
write.table(result, "cleandat_average.txt")
