## The Variables Involved are 
 
Xtrain <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")
SubTrain <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
Xtest <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")
SubTest <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
activityLabels <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
features <-read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")


Xtotal <- rbind(Xtrain, Xtest)                      **Merging Row wise  Xtrain and Xtest**

Ytotal <- rbind(Ytrain, Ytest)                **Merging Row wise  Ytrain and Ytest**

SubTotal <- rbind(SubTrain, SubTest)               **Merging Row wise  SubTrain and SubTest**


### The below variable takes only values with mean and standard deviation from features.txt

FVIndices <- grep("mean\\(\\)|std\\(\\)",features[,2],value = F)

### The below contains the final DataFrame with sorting done by activity type and subject

FinalCleanSum <- FinalSet %>% group_by(subYTotAct,Subject) %>% summarize_each(funs(mean))
