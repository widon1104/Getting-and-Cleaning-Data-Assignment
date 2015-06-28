#收集和整理数据 课程项目

run_analysis.R 进行了如下操作  
1) 整合培训和测试集，创建一个数据集。  
2) 仅提取测量的平均值以及每次测量的标准差。  
3) 使用描述性活动名称命名数据集中的活动  
4) 使用描述性变量名称恰当标记数据集。  
5) 从第4步的数据集中，针对每个活动和每个主题使用每个表里的平均值建立第2个独立的整洁数据集。

以下是该项目的数据：  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

下载解压以后  

1) setwd("UCI HAR Dataset/")  
2) source("../run_analysis.R")

