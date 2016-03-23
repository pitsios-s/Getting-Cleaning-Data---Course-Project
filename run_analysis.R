############################# 1. Download files #############################

if(!file.exists("./data")) { dir.create("./data") }

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile="./data/Dataset.zip")

#############################################################################


############################# 2. Unzip the file #############################

unzip(zipfile="./data/Dataset.zip",exdir="./data")

#############################################################################


############### 3. Read all files concerning the training set ###############

train_data_activities <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = F)
train_data_subjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = F)
train_data <- read.table("./data/UCI HAR Dataset/train/x_train.txt", header = F)

#############################################################################


############### 4. Read all files concerning the test dataset ###############

test_data_activities <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = F)
test_data_subjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = F)
test_data <- read.table("./data/UCI HAR Dataset/test/x_test.txt", header = F)

#############################################################################


######################## 5. Combine the data tables #########################

all_activities <- rbind(train_data_activities, test_data_activities)
all_subjects <- rbind(train_data_subjects, test_data_subjects)
all_data <- rbind(train_data, test_data)

#############################################################################


########################## 6. Set names to columns ##########################

names(all_activities) <- c("activity")
names(all_subjects) <- c("subject")

feature_names <- read.table("./data/UCI HAR Dataset/features.txt", header = F)
names(all_data) <- feature_names[, 2]

#############################################################################


############### 7. Merge data tables to create a complete one ###############

Data <- cbind(all_subjects, all_activities, all_data)

#############################################################################


############# 8. Extract columns with means and st. deviations ##############

wanted_names <- feature_names$V2[grep("mean\\(\\)|std\\(\\)", feature_names$V2)]

n <- c("subject", "activity", as.character(wanted_names))

Data <- subset(Data, select = n)

#############################################################################


################# 9. Use activity names instead of integers #################

activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = F, stringsAsFactors = T)

Data[, 2] <- activity_labels[Data[, 2], 2]

#############################################################################


###### 9. Create and save a tidy dataset with the means of each variable ####

tidy <- aggregate(. ~ subject + activity, data = Data, FUN = mean)
tidy <- tidy[order(tidy$subject, tidy$activity), ]

write.table(tidy, file = "./tidy.txt", row.names = F)

#############################################################################
