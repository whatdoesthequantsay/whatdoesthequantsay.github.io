library(ggplot2)

# change these parameters if you wnt
samplesPerExperiment <- 100
nExperiments <- 1000

# generate the experimental data
controls = rnorm(n = samplesPerExperiment*nExperiments, mean = 50, sd = 20)
tests = rnorm(n = samplesPerExperiment*nExperiments, mean = 60, sd = 20)
dim(controls) <- c(samplesPerExperiment, nExperiments)
dim(tests) <- c(samplesPerExperiment, nExperiments)

# this function calculate a p values
pValue <- function(nSamples1, mean1, var1,
                   nSamples2, mean2, var2) {
    delta <- mean2 - mean1
    stderr <- sqrt(var1/nSamples1 + var2/nSamples2)
    z <- delta / stderr
    1 - pnorm(z, mean = 0, sd = 1)
}

# apply the pValue function to the experimental data
pVector <- mapply(pValue,
       apply(controls, 2, length),
       apply(controls, 2, mean),
       apply(controls, 2, var),
       apply(tests, 2, length),
       apply(tests, 2, mean),
       apply(tests, 2, var))

# plot a histogram
myPlot <- ggplot() +
    geom_histogram(aes(x = pVector,
                   fill = ifelse(pVector < 0.05, "#56B4E9", "#E69F00")),
                   binwidth = 0.05,
                   color = "white") +
    scale_fill_discrete(name = "Significance",
                        labels = c("p <= 0.05", "p > 0.05")) +
    theme(axis.title.x = element_blank()) +
    theme(axis.title.y = element_blank())

# ...profit!
plot(myPlot)

sum(pVector <= 0.05)
sum(pVector > 0.05)
summary(pVector)