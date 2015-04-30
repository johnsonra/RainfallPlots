# dataFormatting.R
# Format data and add binary data sets to R package
# Randy Johnson and Emily Mulhern
# CCR Collaborative Bioinformatics Resource at Frederick National Laboratory


# files to add
files <- c(ALL = "ALL_clean_somatic_mutations_for_signature_analysis.txt",
           pancreas = "Pancreas_clean_somatic_mutations_for_signature_analysis.txt",
           thyroid = "Thyroid_clean_somatic_mutations_for_signature_analysis.txt")


#create object for mutation data
formatData <- function(f) # f = file
{
    # read in primary data
    dat <- subset(read.table(f, sep = '\t', na.strings = c('', '-'), stringsAsFactors = FALSE),
                  select = c(3:4, 6:7))

    # name columns
    names(dat) <- c('chrom', 'pos', 'germline', 'somatic')

    # convert sex chromosomes to numeric (X = 23, y = 24)
    dat$chrom <- with(dat, ifelse(chrom == 'X', 23,
                           ifelse(chrom == 'Y', 24, as.numeric(chrom))))

    # rename dat and save in the appropriate place
    eval(parse(text = paste(names(f), "<- dat")))
    eval(parse(text = paste("save(", names(f), ", file = '../RainfallPlots/data/", names(f), ".RData')", sep = '')))

    return(NULL)
}

# run all files through formatData()
for(f in 1:length(files))
    invisible(formatData(files[f]))
