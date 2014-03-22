library(ggplot2)
source("myPalette.r")

gcd <- function(a, b) {
    while ( (c <- a %% b) != 0 ) {
        a <- b
        b <- c
    }
    b
}

i <- c()
j <- c()
k <- c()

# calculate a data frame with i, j, gcd(i, j) in each row
for (a in c(1 : length(cbPalette))) {
    for (b in (1 : a)) {
        index <- print (a * (a - 1) / 2 + b)
        i[index] <- a
        j[index] <- b
        k[index] <- gcd(a,b)
    }
}

data <- data.frame(i,j,k)
data$gcd <- factor(data$k)

# create a grid of dots with color corresponding to gcd
myPlot <- ggplot(data, aes(i, j)) +
    geom_point(size = 10, aes(color = data$gcd)) +
    scale_color_manual(values=cbPalette,
                       name = "Count",
                       breaks = c(1 : 10),
                       labels = c("32", "10", "4", "2", "2", "1", "1", "1", "1","1")
                       ) +
    scale_x_continuous(breaks = c(1 : 10)) +
    scale_y_continuous(breaks = c(1 : 10)) +
    theme(axis.title.x = element_blank()) +
    theme(axis.title.y = element_blank())

# label each dot with gcd(i, j)
for (n in 1 : nrow(data)) {
    myPlot <- myPlot + annotate("text", x = data[n,]$i, y = data[n,]$j, label = toString(data[n,]$k))
}
# with a white label for the black dot
myPlot <- myPlot + annotate("text", x = 9, y = 9, label = "1", color="white")

#plot and save
plot(myPlot)
ggsave(myPlot, file = "dirichlet.png")
