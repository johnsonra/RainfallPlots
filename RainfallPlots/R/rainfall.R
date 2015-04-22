# rainfall.R
# Create dummy data to start working on Rainfall Plots
# Randall Johnson
# BSP CCR Genetics Core at Frederick National Laboratory
# CCR Collaborative Genetics Resource at NCI
# Leidos Biomedical Research, Inc
# Created January 28, 2015
# Last Modified January 28, 2015

Rainfall <- function(position, distance, cols = c('blue', 'black', 'orange', 'purple', 'yellow', 'green'), mutations = c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G')) 
{
dat <- data.frame(pos = runif(n, 0, 3e9),
                  mutation = sample(c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G'), size = n, replace = TRUE),
                  stringsAsFactors = FALSE)

dat <- dat[order(dat$pos),]

position <- dat$pos

#set the y axis equal to the difference in position data
n <- length(dat$pos)
distance <- c(NA, dat$pos[-1]-dat$pos[-n])

#assign colors to the mutations
cols <- c('blue', 'black', 'orange', 'purple', 'yellow', 'green')
names(cols) <- c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G')

#create rainfall plot
plot(position,distance, xlab='genomic position', ylab='genomic distance', col=cols[dat$mutation], pch=16)

#add a legend
legend(1.25e+09, 2500000, title="Mutations", cex=0.75, pch=16, col=c("blue", "black", "orange", "purple", "yellow", "green"), legend= c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G'), ncol=6)

#check that position & distance lengths are ok
if(length(dat$pos) != length(dat$distance))
	warning("length of position does not equal length of distance")
	

}

# number of sites
n <- 10000

# set random seed and generate data
set.seed(928347)

# this could be a lot better...should add chromosome numbers based on the genomic position
dat <- data.frame(pos = runif(n, 0, 3e9),
                  mutation = sample(c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G'), size = n, replace = TRUE),
                  stringsAsFactors = FALSE)

dat <- dat[order(dat$pos),]

#set the x axis equal to position data
x <- dat$pos

#set the y axis equal to the difference in position data
n <- length(dat$pos)
y <- c(NA, dat$pos[-1]-dat$pos[-n])

#assign colors to the mutations
cols <- c('blue', 'black', 'orange', 'purple', 'yellow', 'green')
names(cols) <- c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G')

#create rainfall plot
plot(x,y, xlab='genomic position', ylab='genomic distance', col=cols[dat$mutation], pch=16)

#add a legend
legend(1.25e+09, 2500000, title="Mutations", cex=0.75, pch=16, col=c("blue", "black", "orange", "purple", "yellow", "green"), legend= c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G'), ncol=6)

 
 
 
