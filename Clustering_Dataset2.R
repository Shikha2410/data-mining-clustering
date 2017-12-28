#Function to read file
readfile <- function(dataset_filepath){
  return (read.csv(file=dataset_filepath, header=TRUE, sep=","));
}

#Elbow Method for finding the optimal number of clusters
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc)
  {
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)
  }
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")
}

#Forms clusters based on given data set using the K-Means Clustering Algorithm
myKMEANS <- function(data_matrix,k){
  km.res <- kmeans(data_matrix, k, nstart = 25)
  return (km.res)
}

#install.packages(c("magrittr"))

# Set to your dataset's file path
DATASET_FILEPATH <- "C:/Users/shikh/Documents/University of Florida/Courses/Sem2/Data Mining/Project 2/dataset2.csv"

require(magrittr)

set.seed(231)

# Prepare Data
MyData <- readfile(DATASET_FILEPATH) 
data_matrix <- MyData %>% na.omit()
wssplot(data_matrix)

# Optimal number of clusters determined from the plot
optimal_k <- 10

reskm <- myKMEANS(data_matrix,optimal_k)

# BSS/TSS Ratio Calculation
total_variance <- reskm$betweenss/reskm$totss
