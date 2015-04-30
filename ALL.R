#create object for ALL mutation data
ALL <- read.table("Data/ALL_clean_somatic_mutations_for_signature_analysis.txt", na.strings = '', stringsAsFactors = FALSE, sep = '\t')

#save the data object
save(ALL, file = "RainfallPlots/data/ALL.RData")
