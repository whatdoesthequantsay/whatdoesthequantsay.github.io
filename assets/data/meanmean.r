library(ggplot2)

# x axis goes from -5 to 5 skipping 0
d <- c(seq(-5,-0.01,by=0.01), seq(0.01,5,by=0.01))

# only two values in our sequence
samples <- c(1, 99)

# calculate all the power means
y <- ((1^d + 99^d)/2)^(1/d)

myPlot <- ggplot() +
    geom_line(aes(x=d, y=y), color="#56B4E9") +
    geom_point(size = 5, aes(x = -1, y = ((1/1 + 1/99)/2)^(-1), color = "#E69F00")) +
    geom_point(size = 5, aes(x = -0, y = sqrt(99), color = "#009E73")) +
    geom_point(size = 5, aes(x = 1, y = (1 + 99)/2, color = "#F0E442")) +
    geom_point(size = 5, aes(x = 2, y = sqrt((1+99^2)/2), color = "#0072B2")) +
    scale_color_manual(values=c("#E69F00","#009E73","#F0E442","#0072B2"),
                       breaks = c("#E69F00", "#009E73", "#F0E442", "#0072B2"),
                       labels = c("harmonic", "geometric", "arithmetic", "quadratic")) +
    theme(axis.title.x = element_blank()) +
    theme(axis.title.y = element_blank()) +
    theme(legend.title = element_blank())


# ...profit!
plot(myPlot)

