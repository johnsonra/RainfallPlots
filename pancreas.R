#create object for pancreas mutation data
pancreas <- read.table("Data/Pancreas_clean_somatic_mutations_for_signature_analysis.txt", na.strings = '', stringsAsFactors = FALSE, sep = '\t')

#save data object
save(pancreas, file = 'RainfallPlots/data/pancreas.RData')
