# rainfallPlot.R
# Create Rainfall Plot
# Randall Johnson and Emily Mulhern
# CCR Collaborative Genetics Resource
# National Cancer Institute


rainfallPlot <- function(position, distance, cols = c('blue', 'black', 'orange', 'purple', 'yellow', 'green'),
                         mutations = c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G'))
{


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
