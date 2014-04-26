library(ggplot2)

# change these parameters if you wnt
samplesPerExperiment <- 2
nExperiments <- 100000

# generate the experimental data
controls = rnorm(n = samplesPerExperiment*nExperiments, mean = 0, sd = 1)
tests = rnorm(n = samplesPerExperiment*nExperiments, mean = 0, sd = 1)
dim(controls) <- c(samplesPerExperiment, nExperiments)
dim(tests) <- c(samplesPerExperiment, nExperiments)

# this function calculates a t? value
tValue <- function(nSamples1, mean1, var1,
                   nSamples2, mean2, var2) {
    delta <- mean1 - mean2
    stderr <- sqrt(var1/nSamples1 + var2/nSamples2)
    t <- delta / stderr
}

xNorm <- seq(-5, 5, length = 1000)
yNorm <- dnorm(xNorm, mean = 0, sd = 1)
xTDist <- seq(-5, 5, length = 1000)
yTDist <- dt(xTDist, df = 2 * samplesPerExperiment - 2)

# apply the tValue function to the experimental data
tVector <- mapply(tValue,
       apply(controls, 2, length),
       apply(controls, 2, mean),
       apply(controls, 2, var),
       apply(tests, 2, length),
       apply(tests, 2, mean),
       apply(tests, 2, var))

# plot a histogram, centered around zero
mean(tVector)
tVector <- tVector - mean(tVector)
tVector <- tVector[abs(tVector) <= 5]
myPlot <- ggplot() +
    geom_histogram(aes(x = tVector, y = ..density..,
                   fill = "#E69F00"), # orange
                   binwidth = 0.05,
                   color = "white") +
    geom_line(aes(x = xNorm, y = yNorm), color = "#56B4E9") +   # blue
    geom_line(aes(x = xTDist, y = yTDist), color = "#009E73") + # green
    theme(axis.title.x = element_blank()) +
    theme(axis.title.y = element_blank())

# ...profit!
plot(myPlot)
