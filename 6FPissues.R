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

HondaTweets$Issue <- ifelse(grepl("Issue", HondaTweets$text,ignore.case = TRUE),1,0)
HondaTweetsBodyTypesIssue <- HondaTweets[HondaTweets$Issue == 1 ,]

HondaGraph <- ggplot(data=HondaTweetsBodyTypesIssue, aes(factor(HondaTweetsBodyTypesIssue$Issue))) + 
  geom_bar(stat="count", fill = "blue") +
  ylab("Count") + xlab("Honda Issues") +
  theme(text=element_text(size=14,face="bold")) +
  scale_x_discrete(labels=c(""))

#--------- Toyota

ToyotaTweets$Issue <- ifelse(grepl("Issue", ToyotaTweets$text,ignore.case = TRUE),1,0)
ToyotaTweetsBodyTypesIssue <- ToyotaTweets[ToyotaTweets$Issue == 1 ,]

ToyotaGraph <- ggplot(data=ToyotaTweetsBodyTypesIssue, aes(factor(ToyotaTweetsBodyTypesIssue$Issue))) + 
  geom_bar(stat="count", fill = "blue") +
  ylab("Count") + xlab("Toyota Issues") +
  theme(text=element_text(size=14,face="bold")) +
  scale_x_discrete(labels=c(""))

# draw graph
grid.arrange(HondaGraph, ToyotaGraph, ncol=2)


