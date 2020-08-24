library(data.table)

# Change this if your files are stores elsewhere
directory <- "UCI HAR Dataset"

# Load training data
train_X <- read.table(paste0(directory, "/train/X_train.txt"))
train_y <- read.table(paste0(directory, "/train/y_train.txt"))
train_sub <-
  read.table(paste0(directory, "/train/subject_train.txt"))

# Load testing data
test_X <- read.table(paste0(directory, "/test/X_test.txt"))
test_y <- read.table(paste0(directory, "/test/y_test.txt"))
test_sub <- read.table(paste0(directory, "/test/subject_test.txt"))

# Merge training and testing data together
X <- rbind(train_X, test_X)
y <- rbind(train_y, test_y)
sub <- rbind(train_sub, test_sub)

# Set column names for y and sub
colnames(sub) <- "Subject"
colnames(y) <- "Activity"

# Read in the features
features <-
  read.table(paste0(directory, "/features.txt"), row.names = 1)
# Compute index and name of all the mean
# feature measurements
means_idx <- grep("mean", features[, 1], ignore.case = TRUE)
means_names <- features[means_idx, 1]

# remove std max min etc. from X and change the
# column names to something human readable
only_means_X <- X[, means_idx]
colnames(only_means_X) <- means_names

# Read activity labels and translate the numbers in
# y to corresponding activity
activity_labels <-
  read.table(paste0(directory, "/activity_labels.txt"), row.names = 1)
y[, 1] <- activity_labels[y[, 1],]

# Aggregate on the basis of activity and subject
df <- aggregate(only_means_X,
                by = c(sub, y),
                FUN = mean)
write.table(df, file = "tidy UCI HAR Dataset.txt", row.names = FALSE)
