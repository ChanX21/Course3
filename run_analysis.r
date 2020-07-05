library(dplyr) 

#We Use dplyr function for manipulating grammar

Xtrain <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")
SubTrain <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
Xtest <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")
SubTest <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
activityLabels <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
features <-read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

# The Above Data are all for Assigning Data in The Project Datasets to the respective Variables

Xtotal <- rbind(Xtrain, Xtest)   #Merging Row wise  Xtrain and Xtest
Ytotal <- rbind(Ytrain, Ytest)   #Merging Row wise  Ytrain and Ytest
SubTotal <- rbind(SubTrain, SubTest) #Merging Row wise  SubTrain and SubTest
names(Xtotal) <- features[,2]
FVIndices <- grep("mean\\(\\)|std\\(\\)",features[,2],value = F)
Xtotal <- Xtotal[,FVIndices]
names(SubTotal) <- "Subject"
names(Ytotal) <- "Activity"
Ytotal$ActivityLabel <- factor(Ytotal$Activity , labels = as.character(activityLabels[,2]))
subYTotAct <- Ytotal$ActivityLabel
FinalSet <- cbind(Xtotal,SubTotal,subYTotAct)
FinalCleanSum <- FinalSet %>% group_by(subYTotAct,Subject) %>% summarize_each(funs(mean))
write.table(FinalCleanSum,"C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/NewTidyOutput.txt",col.names = T ,row.names = T)
