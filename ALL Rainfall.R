#read ALL data into R
data <- load('RainfallPlots/data/ALL.Rdata')
data <- ALL

#convert chromosome into numeric
data$V3 <- as.numeric(data$V3)

#order data
data <- data[order(data$V3, data$V4), ]

#rename vectors
names(data) <- c('V1', 'V2','chrom', 'pos', 'pos', 'V6', 'V7', 'V8')

data <- dat

#run Rainfall package
library(RainfallPlots)

rainfallPlot(data)



