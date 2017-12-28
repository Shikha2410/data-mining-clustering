#Function to read file
readfile <- function(dataset_filepath){
  return (read.csv(file=dataset_filepath, header=TRUE, sep=","));
}

#Forms clusters based on given data set using the Hierarchical Clustering Algorithm.
myHCLUST <- function(data_matrix){
  # Compute hierarchical clustering
  res.hc <- data_matrix %>%
    dist(method = "euclidean") %>% # Compute dissimilarity matrix
    hclust(method = "ward.D2")     # Compute hierachical clustering
  return (res.hc)
}

#Forms clusters based on given data set using the K-Means Clustering Algorithm.
myKMEANS <- function(data_matrix){
  km.res <- kmeans(data_matrix, 8, nstart = 25)
  return (km.res)
}

#Forms clusters based on given data set using the DBSCAN (Density-based) Clustering Algorithm.
myDBSCAN <- function(data_matrix){
  kNNdistplot(data_matrix, k =  8)
  abline(h = 1.463, lty = 2)
  db <- fpc::dbscan(data_matrix, eps = 1.463, MinPts = 8)
  return (db)
}

#Forms clusters based on given data set using the Shared Nearest Neighbor (Graph-based) Clustering Algorithm.
mySNNCLUST <- function(data_matrix){
  kNNdistplot(data_matrix, k =  8)
  abline(h = 10, lty = 2)
  snn <- dbscan::sNNclust(data_matrix, k = 20, eps = 10, minPts = 16,borderPoints = TRUE)
  return (snn)
}

#install.packages(c("factoextra","magrittr","fpc","rgl","car","ClusterR","mclust","dbscan"))

# Set to your dataset's file path
DATASET_FILEPATH <- "C:/Users/shikh/Documents/University of Florida/Courses/Sem2/Data Mining/Project 2/dataset1.csv"

# Default SEED_VALUE = 231
# Change the seed value here (Increment by 1 upto 235 for K-Means clustering technique)
SEED_VALUE <- 231

require(factoextra)
require(magrittr)
require(fpc)
require(rgl)
require(car)
require(ClusterR)
require(mclust)
require(dbscan)

set.seed(SEED_VALUE)

# Data Preparation
MyData <-readfile(DATASET_FILEPATH) 
data_matrix <- as.matrix(MyData[, -4])
data_matrix <- na.omit(data_matrix)
labels <- MyData$cluster

#Scatter Plot of the original data
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z, surface=FALSE, grid = FALSE, point.col = labels)


#Agglomerative Hierarchical Clustering Algorithm
hier_clust <- myHCLUST(data_matrix)
predictions <- cutree(hier_clust, k = 8 )

reshc = external_validation(labels, predictions, method = "adjusted_rand_index", summary_stats = T)
#Scatter Plot of the results
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z,surface=FALSE, grid = FALSE, point.col = predictions)
# Visualize using factoextra
# Cut in 8 groups and color by groups
# fviz_dend(hier_clust, k = 8, # Cut in eight groups
#          cex = 0.5, # label size
#          color_labels_by_k = TRUE, # color labels by groups
#          rect = TRUE # Add rectangle around groups
# )

#K-means Clustering Algorithm
kmeans_clust <- myKMEANS(data_matrix)

reskm = external_validation(labels, kmeans_clust$cluster, method = "adjusted_rand_index", summary_stats = T)
#Scatter Plot of the results
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z,point.col = kmeans_clust$cluster, surface=FALSE, grid = FALSE)


#DBSCAN (Density-based) Clustering Algorithm
dbscan_clust <- myDBSCAN(data_matrix)

resdb = external_validation(labels, dbscan_clust$cluster, method = "adjusted_rand_index", summary_stats = T)
#Scatter Plot of the results
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z,point.col = dbscan_clust$cluster + 1, surface=FALSE, grid = FALSE)

#Implementation for Shared Nearest Neighbor (Graph-based) Clustering Algorithm
snn_clust <- mySNNCLUST(data_matrix)

ressc = external_validation(labels, snn_clust$cluster, method = "adjusted_rand_index", summary_stats = T)
#Scatter Plot of the results
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z,point.col = snn_clust$cluster + 1, surface=FALSE, grid = FALSE)
