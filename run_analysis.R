loadData <- function(){
    testDS <- loadTestDataSet()
    trainDS <- loadTrainDataSet()
    mergedDS <- rbind(trainDS, testDS)
    colnames(mergedDS) <- loadFeaturesDescriptions()
    mergedWithVariableNames <- mergedDS[,getMeanAndStdRelatedColumns()]
    mergedWithVariableNames <- addActivityLabels(mergedWithVariableNames)
    melted <- melt(mergedWithVariableNames, id.vars = 67:68, measure.vars = 1:66)
    finalResult <- dcast(melted, activity + subject ~ variable, mean)
    write.table(finalResult,"tidy.txt", row.names = FALSE)
}

loadTestDataSet <- function(){
    testDataSet <- read.csv("test/X_test.txt", header = FALSE, sep = "")
    testDataSetLabels <- read.csv("test/y_test.txt", header = FALSE, sep = " ")
    testDataSubjects <-  read.csv("test/subject_test.txt", header = FALSE, sep = " ")
    cbind(testDataSet,testDataSetLabels,testDataSubjects)
}

loadTrainDataSet <- function(){
    trainDataSet <- read.csv("train/X_train.txt", header = FALSE, sep = "")
    trainDataSetLabels <- read.csv("train/y_train.txt", header = FALSE, sep = " ")
    trainDataSetSubjects <- read.csv("train/subject_train.txt", header = FALSE, sep = " ")
    cbind(trainDataSet,trainDataSetLabels, trainDataSetSubjects)
}

loadFeaturesDescriptions <- function(){
    features <- read.csv("features.txt", header = FALSE, sep = "")
    vec <- as.vector(features[,2])
    c(vec,"activity","subject" )
}

getMeanAndStdRelatedColumns <- function(){
    c(1,2,3,4,5,6, 41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543,562,563)
}

loadActivityLabels <- function(){
    read.csv("activity_labels.txt", header = FALSE, sep = "")
}

addActivityLabels <- function(dataFrame){
    activityLabels <- loadActivityLabels()
    dataFrame$activity <- activityLabels[,2][match(dataFrame$activity,activityLabels[,1])]
    dataFrame
}