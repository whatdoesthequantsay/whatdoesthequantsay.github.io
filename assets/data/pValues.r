library(ggplot2)

# change these parameters if you wnt
samplesPerExperiment <- 32
nExperiments <- 1000

# generate the experimental data
controls = rnorm(n = samplesPerExperiment*nExperiments, mean = 50, sd = 20)
tests = rnorm(n = samplesPerExperiment*nExperiments, mean = 60, sd = 20)
dim(controls) <- c(samplesPerExperiment, nExperiments)
dim(tests) <- c(samplesPerExperiment, nExperiments)

# this function calculate a p values
pValue <- function(nSamples1, mean1, var1,
                   nSamples2, mean2, var2) {
    delta <- mean1 - mean2
    sp2 <- ((nSamples1 - 1) * var1 + (nSamples2 - 1) * var2) / (nSamples1 + nSamples2 - 2)
    stderr <- sqrt(sp2 * (1 / nSamples1 + 1 / nSamples2))
    t <- delta / stderr
    pt(-abs(t), df = 2 * samplesPerExperiment - 2) +
        1 - pt(abs(t), df = 2 * samplesPerExperiment - 2)
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
                   fill = ifelse(pVector <= 0.05, "#56B4E9", "#E69F00")),
                   binwidth = 0.05,
                   color = "white") +
    scale_fill_discrete(name = "Significance",
                        labels = c("p <= 0.05", "p > 0.05")) +
    theme(axis.title.x = element_blank()) +
    theme(axis.title.y = element_blank())

# ...profit!
plot(myPlot)

# print out stuff
print(sum(pVector <= 0.05))
print(sum(pVector > 0.05))
print(summary(pVector))