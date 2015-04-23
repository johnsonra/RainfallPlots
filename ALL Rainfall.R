#read ALL data into R
data <- read.table("Data/ALL_clean_somatic_mutations_for_signature_analysis.txt", na.strings = '',
                   stringsAsFactors = FALSE, sep = '\t')

#convert chromosome into numeric
data$V3 <- as.numeric(data$V3)

#order data
data <- data[order(data$V3, data$V4), ]

#rename vectors
names(data) <- c('V1', 'V2','chrom', 'pos', 'pos', 'V6', 'V7', 'V8')

#run Rainfall package
library(RainfallPlot)

rainfallPlot(data)


