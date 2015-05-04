# rainfallPlot.R
# Create Rainfall Plot
# Randall Johnson and Emily Mulhern
# CCR Collaborative Genetics Resource
# National Cancer Institute


rainfallPlot <- function(chrom, pos, mutation, cols = c('blue', 'black', 'orange', 'purple', 'yellow', 'green'),
                         mutations = c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G'))
{

    #check that position & distance lengths are ok
    if(length(pos) != length(chrom) | length(pos) != length(mutation))
	warning("chrom, pos and mutation must have the same number of elements")


ordered <- order(chrom, pos)

chrom <- chrom[ordered]

pos <- pos[ordered]

mutation <- mutation[ordered]


#set the y axis equal to the difference in position data
n <- length(pos)
distance <- c(NA, pos[-1]-pos[-n])

distance <- ifelse(distance < 0, NA, distance)


#assign colors to the mutations
cols <- c('blue', 'black', 'orange', 'purple', 'yellow', 'green')
names(cols) <- c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G')

#create rainfall plot
plot(pos,log10(distance), xlab='genomic position', ylab='genomic distance', col=cols[mutation], pch=16)

#add a legend
legend("topright", title="Mutations", cex=0.75, pch=16, col=c("blue", "black", "orange", "purple", "yellow", "green"), legend= c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G'), ncol=6)
}
