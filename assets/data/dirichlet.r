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

myPlot <- ggplot(data, aes(i, j)) +
    coord_equal() +
    geom_point(size = 10, aes(color = data$gcd)) +
    annotate("text", x = 1, y = 1, label = "1") +
    annotate("text", x = 2, y = 1, label = "1") +
    annotate("text", x = 3, y = 1, label = "1") +
    annotate("text", x = 4, y = 1, label = "1") +
    annotate("text", x = 5, y = 1, label = "1") +
    annotate("text", x = 6, y = 1, label = "1") +
    annotate("text", x = 7, y = 1, label = "1") +
    annotate("text", x = 8, y = 1, label = "1") +
    annotate("text", x = 9, y = 1, label = "1") +
    annotate("text", x = 10, y = 1, label = "1") +
    annotate("text", x = 2, y = 2, label = "2") +
    annotate("text", x = 3, y = 2, label = "1") +
    annotate("text", x = 4, y = 2, label = "2") +
    annotate("text", x = 5, y = 2, label = "1") +
    annotate("text", x = 6, y = 2, label = "2") +
    annotate("text", x = 7, y = 2, label = "1") +
    annotate("text", x = 8, y = 2, label = "2") +
    annotate("text", x = 9, y = 2, label = "1") +
    annotate("text", x = 10, y = 2, label = "2") +
    annotate("text", x = 3, y = 3, label = "3") +
    annotate("text", x = 4, y = 3, label = "1") +
    annotate("text", x = 5, y = 3, label = "1") +
    annotate("text", x = 6, y = 3, label = "3") +
    annotate("text", x = 7, y = 3, label = "1") +
    annotate("text", x = 8, y = 3, label = "1") +
    annotate("text", x = 9, y = 3, label = "3") +
    annotate("text", x = 10, y = 3, label = "1") +
    annotate("text", x = 4, y = 4, label = "4") +
    annotate("text", x = 5, y = 4, label = "1") +
    annotate("text", x = 6, y = 4, label = "2") +
    annotate("text", x = 7, y = 4, label = "1") +
    annotate("text", x = 8, y = 4, label = "4") +
    annotate("text", x = 9, y = 4, label = "1") +
    annotate("text", x = 10, y = 4, label = "2") +
    annotate("text", x = 5, y = 5, label = "5") +
    annotate("text", x = 6, y = 5, label = "1") +
    annotate("text", x = 7, y = 5, label = "1") +
    annotate("text", x = 8, y = 5, label = "1") +
    annotate("text", x = 9, y = 5, label = "1") +
    annotate("text", x = 10, y = 5, label = "5") +
    annotate("text", x = 6, y = 6, label = "6") +
    annotate("text", x = 7, y = 6, label = "1") +
    annotate("text", x = 8, y = 6, label = "2") +
    annotate("text", x = 9, y = 6, label = "3") +
    annotate("text", x = 10, y = 6, label = "2") +
    annotate("text", x = 7, y = 7, label = "7") +
    annotate("text", x = 8, y = 7, label = "1") +
    annotate("text", x = 9, y = 7, label = "1") +
    annotate("text", x = 10, y = 7, label = "1") +
    annotate("text", x = 8, y = 8, label = "8") +
    annotate("text", x = 9, y = 8, label = "1") +
    annotate("text", x = 10, y = 8, label = "2") +
    annotate("text", x = 9, y = 9, label = "9", color="#FFFFFF") +
    annotate("text", x = 10, y = 9, label = "1") +
    annotate("text", x = 10, y = 10, label = "10") +
    scale_color_manual(values=cbPalette,
                       name = "Count",
                       breaks = c(1 : length(cbPalette)),
                         labels = c("32", "10", "4", "2", "2", "1", "1", "1", "1","1")
                         ) +
    scale_x_continuous(breaks = c(1 : length(cbPalette))) +
    scale_y_continuous(breaks = c(1 : length(cbPalette))) +
    theme(axis.title.x = element_blank()) +
    theme(axis.title.y = element_blank())

plot(myPlot)

ggsave(myPlot, file = "dirichlet.png")
