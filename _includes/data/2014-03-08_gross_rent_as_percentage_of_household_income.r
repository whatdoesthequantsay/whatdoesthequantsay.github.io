library(ggplot2)
library(grid)
library(gridExtra)

csvData <- read.csv("2014-03-08_gross_rent_as_percentage_of_household_income.csv", stringsAsFactors=FALSE)
csvData$Percentage <- factor(csvData$Percentage, levels=csvData[seq(1,18,2),]$Percentage, ordered=TRUE)
csvData$Number<-as.numeric(csvData$Number)
csvData$Err<-as.numeric(csvData$Err)

cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ggplot(data=csvData,
       aes(x = Percentage, y = Number, fill=Universe),
       height=500,
       width=800) +
    geom_bar(stat="identity",
             xlab="2012 Distribution of Gross Rent as Percentage of Household Income",
             color="white") +
    scale_fill_manual(values = c(cbPalette[2],cbPalette[3])) + 
    facet_grid(Universe ~ ., scales="free_y") +    
    theme(axis.text.x=element_text(angle=60, hjust=1),
          axis.title.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          axis.title.y=element_blank(),
          legend.position="none")

USNumber=sum(subset(csvData,Universe=="US")$Number);
NYNumber=sum(subset(csvData,Universe=="NEW YORK")$Number);
csvDataUS=subset(csvData,Universe==factor("US"))
csvDataNY=subset(csvData,Universe==factor("NEW YORK"))
csvDataUS$RelativeNumber=(csvDataNY$Number/NYNumber)/(csvDataUS$Number/USNumber)

#ggplot(data=csvDataUS,
#       aes(x = Percentage, y = RelativeNumber, fill="darkgray"),
#       height=500,
#       width=800) +
#    geom_bar(stat="identity",
#             xlab="Distribution of Gross Rent as Percentage of Household Income",
#             color="white") +
#    theme(axis.text.x=element_text(angle=60, hjust=1),
#          axis.title.x=element_blank(),
#          legend.position="none")


ggsave("2014-03-08_gross_rent_as_percentage_of_household_income.png", width=8, height=5)




