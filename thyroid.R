#create object for thyroid mutation data
thyroid <- read.table("Data/Thyroid_clean_somatic_mutations_for_signature_analysis.txt", na.strings = '', stringsAsFactors = FALSE, sep = '\t')

#save data object
save(thyroid, file = "thyroid.Rdata")