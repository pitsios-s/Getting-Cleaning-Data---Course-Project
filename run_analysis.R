# This function is used in order to keep only the columns that contain measurements
# about the means and standard deviations of the data that we read.
keep_necessary_columns <- function(inp_df) {
  names_splitted <- strsplit(names(inp_df), "\\.")
  
  cols = vector()
  names_fixed = vector()
  
  for (i in 1: length(names_splitted)) {
    current_vector <- names_splitted[[i]]
    
    if ( grepl("^mean$", current_vector[2]) ) {
      cols[i] <- TRUE
      
      if (is.na(current_vector[5])) {
        names_fixed[i] <- paste(current_vector[1], "Mean", sep = "")
      } else {
        names_fixed[i] <- paste(current_vector[1], "Mean", current_vector[5], sep = "")
      }
    } else if ( grepl("^std$", current_vector[2]) ) {
      cols[i] <- TRUE
      
      if (is.na(current_vector[5])) {
        names_fixed[i] <- paste(current_vector[1], "Std", sep = "")
      } else {
        names_fixed[i] <- paste(current_vector[1], "Std", current_vector[5], sep = "") 
      }
    } else {
      cols[i] <- FALSE
      names_fixed[i] <- "NULL"
    }
  }
  
  names(inp_df) <- names_fixed
  
  inp_df[, cols]
}


# Load features
features <- read.table("./UCI HAR Dataset/features.txt", header = F, stringsAsFactors = F)

# Load activity labels.
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = F, stringsAsFactors = T)


########## Loading and creating the train dataset ##########

train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", header = F, stringsAsFactors = F, col.names = features$V2)

train_activities <- read.table("./UCI HAR Dataset/train/y_train.txt", header = F)

train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = F)

train_data <- keep_necessary_columns(train_data)

train_data$activity <- activities[train_activities[1, ], 2]
train_data$subject <- train_subjects[, 1]

########################################################


########## Loading and creating the test dataset ##########

test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", header = F, stringsAsFactors = F, col.names = features$V2)

test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt", header = F)

test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = F)

test_data <- keep_necessary_columns(test_data)

test_data$activity <- activities[test_activities[1, ], 2]
test_data$subject <- test_subjects[, 1]

########################################################


# Combine the 2 datasets above to create one bigger.
merged_dataset <- rbind(train_data, test_data)



