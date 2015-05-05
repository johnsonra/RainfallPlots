# load Rainfall package
library(RainfallPlots)

# load ALL data into R
data(ALL)
data(pancreas)

with(ALL, rainfallPlot(chrom, pos, paste(germline, somatic, sep = '>')))
with(pancreas, rainfallPlot(chrom, pos, paste(germline, somatic, sep = '>')))

