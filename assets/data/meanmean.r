library(ggplot2)

# change these parameters if you want
max = 100
num_samples = 100

# generate 100 samples from 0 to 100
samples <- max * runif(num_samples)

# my power mean function
powermean <- function(samples, d) {
    if (d == 0) {
        exp(sum(log(samples)) / length(samples))
    } else {
        (sum(samples ^ d) / length(samples)) ^ (1 / d)
    }
}

# x axis goes from -10 to 5 skipping 0
d <- c(seq(-10,-0.01,by = 0.01), seq(0.01,10,by = 0.01))

# calculate all the power means
y <- sapply(d, function(d) powermean(samples, d))

myPlot <- ggplot() +
    geom_line(aes(x = d, y = y), color = "#56B4E9") +
    geom_point(size = 5,
               aes(x = -1, y = powermean(samples, -1),color = "#E69F00")) +
    geom_point(size = 5,
               aes(x = -0, y = powermean(samples, 0), color = "#009E73")) +
    geom_point(size = 5,
               aes(x = 1, y = powermean(samples, 1), color = "#F0E442")) +
    geom_point(size = 5,
               aes(x = 2, y = powermean(samples, 2), color = "#0072B2")) +
    scale_color_manual(values = c("#E69F00","#009E73","#F0E442","#0072B2"),
                       breaks = c("#E69F00", "#009E73", "#F0E442", "#0072B2"),
                       labels = c("harmonic",
                                  "geometric",
                                  "arithmetic",
                                  "quadratic")) +
    theme(axis.title.x = element_blank()) +
    theme(axis.title.y = element_blank()) +
    theme(legend.title = element_blank())

# ...profit!
plot(myPlot)