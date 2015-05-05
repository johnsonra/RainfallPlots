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


    # reorder by chromosome/position
ordered <- order(chrom, pos)

chrom <- chrom[ordered]

pos <- pos[ordered]

mutation <- mutation[ordered]

    # stack chromosomes so they don't all get plotted over the top of eachother
    # find ends of chromosomes
    ends <- which(chrom[-1] != chrom[-length(chrom)])

    # find how much to add to the subsequent chromosome to string them along the x-axis, rather than on top of each other
    to.add <- cumsum(c(0, pos[ends]))

    # rearrange order by chromosome
    pos <- pos + to.add[chrom]

#set the y axis equal to the difference in position data
n <- length(pos)
distance <- c(NA, pos[-1]-pos[-n])

distance <- ifelse(distance < 0, NA, distance)

    # set width to remove extra 7% added to edges of x-axis
    r <- range(pos, na.rm = TRUE)
    w <- diff(r) / 1.07
    xlim <- c(mean(r) - w/2, mean(r) + w/2)

#assign colors to the mutations
cols <- c('blue', 'black', 'orange', 'purple', 'yellow', 'green')
names(cols) <- c('C>A', 'C>G', 'C>T', 'T>A', 'T>C', 'T>G')

#create rainfall plot
    plot(pos,log10(distance), xlab='', ylab='Genomic distance', col=cols[mutation],
         pch=16, cex = 0.4, yaxt = 'n', xaxt = 'n', xlim = xlim, cex.lab = 1.5)

    figure.limits <- par()$usr

    # label x-axis
    mtext('Genomic position', side = 1, line = 0.5, cex = 1.5)

    # label y-axis
    labels.at <- figure.limits[1] - diff(figure.limits[1:2]) / 25

    axis(2, at = c(0,2,4,6), labels = FALSE)

    text(labels.at, 0, '1', las = 1, xpd = TRUE, adj = 1)
    text(labels.at, 2, labels = expression(10^2), las = 1, xpd = TRUE, adj = 1)
    text(labels.at, 4, labels = expression(10^4), las = 1, xpd = TRUE, adj = 1)
    text(labels.at, 6, labels = expression(10^6), las = 1, xpd = TRUE, adj = 1)

#add a legend
    legend.at <- figure.limits[3] - diff(figure.limits[3:4]) / 15
    legend(mean(r), legend.at, pch=16, col=cols, legend= names(cols), ncol=6, xpd = TRUE, xjust = 0.5, bty = 'n')
}
