# rainfall.R
# Create dummy data to start working on Rainfall Plots
# Randall Johnson
# BSP CCR Genetics Core at Frederick National Laboratory
# CCR Collaborative Genetics Resource at NCI
# Leidos Biomedical Research, Inc
# Created January 28, 2015
# Last Modified January 28, 2015


# number of sites
n <- 10000

# set random seed and generate data
set.seed(928347)

# this could be a lot better...should add chromosome numbers based on the genomic position
dat <- data.frame(pos = runif(n, 0, 3e9),
                  mutation = sample(c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G'), size = n, replace = TRUE),
                  stringsAsFactors = FALSE)

dat <- dat[order(dat$pos),]
