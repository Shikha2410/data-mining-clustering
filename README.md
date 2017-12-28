# Data Mining Clustering
The goal of the project is to increase familiarity with the clustering packages, available in R to do data mining analysis on real-world problems. Several different clustering methods were used on the given datasets. The dataset was as provided. The original cluster column was used as initial label for comparison. kMeans, Hierarchical, DBScan and SNNClust were the clustering methods used on the smaller data set and kMeans was chosen for large data set.


I. Working Environment
----------------------
RStudio (latest version)


II. Packages to be installed
-----------------------------
Run the following command in RStudio's console to install all the required packages.

For Clustering_Dataset1.R -	install.packages(c("factoextra","magrittr","fpc","rgl","car","ClusterR","mclust","dbscan"))
For Clustering_Dataset2.R -	install.packages(c("magrittr"))

Please make sure to check that all the packages get loaded correctly.


III. Clustering on Dataset 1
-----------------------------------------

Instructions for Execution:
1. Set the DATASET_FILEPATH parameter in Clustering_Dataset1.R to the complete file path of the input dataset i.e. dataset1 (shared in the zipped folder).
2. Execute the functions in the beginning of the Clustering_Dataset1.R file to load them into the R environment.
3. Run the script immediately after the functions in Clustering_Dataset1.R to get the clustering results. Note that SEED_VALUE used in this run is the default value - 231.
4. Set SEED_VALUE to 232 and re-run the script. Also re-run for seed values 233,234 and 235.

Results:
1. The summary statistics for evaluating the clustering results are printed on the console for every algorithm per iteration. This matrix contains Accuracy, Adjusted Random Index, Precision, Recall, and other metrics.
2. For a given iteration; a 3D scatter plot of the original data is created. Then, 3D scatter plots of clustered data is generated in a new window for each of the clustering algorithms that you run.


IV. Clustering on Dataset 2
-----------

Instructions for Execution:
1. Set the DATASET_FILEPATH parameter in Clustering_Dataset2.R to the complete file path of the input dataset i.e. dataset2 (shared in the zipped folder).
2. Execute the functions in the beginning of the Clustering_Dataset2.R file to load them into the R environment.
3. Run the script immediately after the functions in Clustering_Dataset2.R to get the clustering results.

Results:
1. A plot of Within groups sum of squares vs Number of clusters is created for the given dataset.
2. The total_variance variable gives the ratio of Between Sum of squares to Total Sum of squares as result of clustering. 

