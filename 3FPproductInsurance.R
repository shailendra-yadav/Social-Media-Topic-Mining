library(twitteR)
library(ggplot2)
library(gridExtra)

#Put the downloaded tweets from file  into a data frames
#HondaTweets <- read.csv("C:\\DataScienceAndAnalytics\\SocialMedia\\GroupProject\\HondaTweets.csv", row.names = 1)
#ToyotaTweets <- read.csv("C:\\DataScienceAndAnalytics\\SocialMedia\\GroupProject\\ToyotaTweets.csv", row.names = 1)

HondaTweets = read.csv("/Users/shailendra/Desktop/projects/FinalProject/HondaTweets.csv", row.names = 1)
ToyotaTweets <- read.csv("/Users/shailendra/Desktop/projects/FinalProject/ToyotaTweets.csv", row.names = 1)

# bodytypes
# hatchback wagon suv crossover coupe sport

#--------- Honda

HondaTweets$Insurance <- ifelse(grepl("insurance", HondaTweets$text,ignore.case = TRUE),1,0)
HondaTweetsBodyTypesInsurance <- HondaTweets[HondaTweets$Insurance == 1 ,]

HondaGraph <- ggplot(data=HondaTweetsBodyTypesInsurance, aes(factor(HondaTweetsBodyTypesInsurance$Insurance))) + 
  geom_bar(stat="count", fill = "blue") +
  ylab("Count") + xlab("Honda Insurance Talk") +
  theme(text=element_text(size=14,face="bold")) +
  scale_x_discrete(labels=c(""))


#--------- Toyota
ToyotaTweets$Insurance <- ifelse(grepl("insurance", ToyotaTweets$text,ignore.case = TRUE),1,0)
ToyotaTweetsBodyTypesInsurance <- ToyotaTweets[ToyotaTweets$Insurance == 1 ,]

ToyotaGraph <- ggplot(data=ToyotaTweetsBodyTypesInsurance, aes(factor(ToyotaTweetsBodyTypesInsurance$Insurance))) + 
  geom_bar(stat="count", fill = "blue") +
  ylab("Count") + xlab("Toyota Insurance Talk") +
  theme(text=element_text(size=14,face="bold")) +
  scale_x_discrete(labels=c(""))

# draw graph
grid.arrange(HondaGraph, ToyotaGraph, ncol=2)


