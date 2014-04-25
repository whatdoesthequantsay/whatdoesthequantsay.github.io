library(ggplot2)

csvData <- read.csv("2014-03-08_household_income.csv", stringsAsFactors=FALSE)
csvData <- csvData[1:42,]
csvData$Income <- factor(csvData$Income, levels=csvData$Income, ordered=TRUE)
csvData$Number<-as.numeric(csvData$Number)

cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
myFill <- rep(cbPalette[1], 42)
myFill[13] <- cbPalette[2]
myFill[15] <- cbPalette[3]
myFill <- factor(myFill)

ggplot(data = csvData,
            aes(x = Income,y = Number),
            height=200,
            width=800) +
    geom_bar(stat="identity",
             xlab="Income",
             color="white",
             fill=myFill) +
    theme(axis.text.x=element_text(angle=60, hjust=1))

ggsave("household_income.png", width=8, height=5)


