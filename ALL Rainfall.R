#read ALL data into R
data <- load('RainfallPlots/data/ALL.Rdata')
data <- ALL


#run Rainfall package
library(RainfallPlots)

with(ALL, rainfallPlot(chrom, pos, paste(germline, somatic, sep = '>')))



