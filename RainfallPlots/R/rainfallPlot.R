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
	stop("chrom, pos and mutation must have the same number of elements")

    # check that cols and mutations are the same length
    if(length(cols) != length(mutations))
        stop("cols and mutations must have the same number of elements")

    # reorder by chromosome/position
    ordered <- order(chrom, pos)

    chrom <- chrom[ordered]

    pos <- pos[ordered]

    mutation <- mutation[ordered]

    # stack chromosomes so they don't all get plotted over the top of eachother
    # find ends of chromosomes
    ends <- which(chrom[-1] != chrom[-length(chrom)])

    # find how much to add to the subsequent chromosome to string them along the x-axis
    to.add <- cumsum(c(0, pos[ends]))

    # find midpoints of chromosomes
    mids <- sapply(na.omit(unique(chrom)), function(i) mean(range(pos[chrom == i], na.rm = TRUE))) + to.add
    names(mids) <- na.omit(unique(chrom))

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
    names(cols) <- mutations

    #create rainfall plot
    plot(pos,log10(distance), xlab='', ylab='Genomic distance', col=cols[mutation],
         pch=16, cex = 0.4, yaxt = 'n', xaxt = 'n', xlim = xlim, cex.lab = 1.5)

    figure.limits <- par()$usr
    margin.height <- sum(par()$mai[c(1,3)])
    margin.width <- sum(par()$mai[c(2,4)])
    figure.width <- par()$fin[1]
    figure.height <- par()$fin[2]

    # label x-axis
    mtext('Genomic position', side = 1, line = 1.8, cex = 1.5)

    for(i in 1:length(mids))
    {
        line <- ifelse(i/2 == round(i/2), -0.3, -1)
        axis(1, at = mids[i], labels = names(mids)[i], tick = FALSE, line = line)
    }

    # label y-axis
    labels.at <- figure.limits[1] - diff(figure.limits[1:2]) * margin.width / (margin.width + figure.width) / 7

    axis(2, at = c(0,2,4,6), labels = FALSE)

    text(labels.at, 0, '1', las = 1, xpd = TRUE, adj = 1)
    text(labels.at, 2, labels = expression(10^2), las = 1, xpd = TRUE, adj = 1)
    text(labels.at, 4, labels = expression(10^4), las = 1, xpd = TRUE, adj = 1)
    text(labels.at, 6, labels = expression(10^6), las = 1, xpd = TRUE, adj = 1)

    #add a legend
    legend.at <- figure.limits[3] - diff(figure.limits[3:4]) * margin.height / (margin.height + figure.height) / 2

    legend(mean(r), legend.at, pch=16, col=cols, legend= names(cols), ncol=6, xpd = TRUE, xjust = 0.5, bty = 'n')

    # add chromosome markers
    abline(v = to.add[-1], col = rgb(.2,.2,.2,.5), lty = 3)
}
