library(ggplot2)

# change these parameters if you want
alpha <- 5
beta <- 15
nSamples <- 1000

# generate samples for U and V according to gamma distributions with shape alpha and beta
u <- rgamma(1000, shape=alpha)
v <- rgamma(1000, shape=beta)

# transform the variables to x and y
x <- u / (u + v)
y <- u + v

# data for pdf of the beta function with shapes alpha and beta
xBeta <- seq(min(x), max(x), length=100)
yBeta <- dbeta(xBeta, shape1=alpha, shape2=beta)

# plot the density of x versus the pdf of the beta distribution
myPlot <- ggplot() +
    geom_histogram(aes(x, y=..density..),binwidth=0.05, color="white", fill="#E69F00") +
    geom_line(aes(x=xBeta, y=yBeta), color="#56B4E9") +
    theme(axis.title.x = element_blank()) +
    theme(axis.title.y = element_blank())


# ...profit!
plot(myPlot)

ggsave(myPlot, file = "beta.png")
