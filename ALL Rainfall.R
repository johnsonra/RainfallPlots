# load Rainfall package
library(RainfallPlots)

# load ALL data into R
data(ALL)

with(ALL, rainfallPlot(chrom, pos, paste(germline, somatic, sep = '>')))

