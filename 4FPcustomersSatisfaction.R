library(twitteR)
library(ggplot2)
library(gridExtra)

#Put the downloaded tweets from file  into a data frames
#HondaTweets <- read.csv("C:\\DataScienceAndAnalytics\\SocialMedia\\GroupProject\\HondaTweets.csv", row.names = 1)
#ToyotaTweets <- read.csv("C:\\DataScienceAndAnalytics\\SocialMedia\\GroupProject\\ToyotaTweets.csv", row.names = 1)

HondaTweets = read.csv("/Users/shailendra/Desktop/projects/FinalProject/HondaTweets.csv", row.names = 1)
ToyotaTweets <- read.csv("/Users/shailendra/Desktop/projects/FinalProject/ToyotaTweets.csv", row.names = 1)
#--------- Honda
HondaTweets$TweetsSmile <- ifelse(grepl(":)", HondaTweets$text,ignore.case = TRUE),1,0)
HondaTweetsSmile <- HondaTweets[HondaTweets$TweetsSmile == 1,]

HondaTweets$TweetsSad <- ifelse(grepl(":\\(", HondaTweets$text,ignore.case = TRUE),1,0)
HondaTweetsSad <- HondaTweets[HondaTweets$TweetsSad == 1,]

HondaTweetsFeelings <- HondaTweets[(HondaTweets$TweetsSmile == 1)|(HondaTweets$TweetsSad == 1),]

HondaGraph <- ggplot(data=HondaTweetsFeelings, aes(factor(HondaTweetsFeelings$TweetsSmile))) + 
  geom_bar( fill = "blue") +
  ylab("Count") + xlab("Honda Customers Satisfaction") +
  theme(text=element_text(size=14,face="bold")) +
  scale_x_discrete(labels=c("Unhappy", "Happy"))


#--------- Toyota
ToyotaTweets$TweetsSmile <- ifelse(grepl(":)", ToyotaTweets$text,ignore.case = TRUE),1,0)
ToyotaTweetsSmile <- ToyotaTweets[ToyotaTweets$TweetsSmile == 1,]

ToyotaTweets$TweetsSad <- ifelse(grepl(":\\(", ToyotaTweets$text,ignore.case = TRUE),1,0)
ToyotaTweetsSad <- ToyotaTweets[ToyotaTweets$TweetsSad == 1,]

ToyotaTweetsFeelings <- ToyotaTweets[(ToyotaTweets$TweetsSmile == 1)|(ToyotaTweets$TweetsSad == 1),]

ToyotaGraph <- ggplot(data=ToyotaTweetsFeelings, aes(factor(ToyotaTweetsFeelings$TweetsSmile))) + 
  geom_bar(stat="count", fill = "blue") +
  ylab("Count") + xlab("Toyota Customers Satisfaction") +
  theme(text=element_text(size=14,face="bold")) +
  scale_x_discrete(labels=c("Unhappy", "Happy"))

# draw graph
grid.arrange(HondaGraph, ToyotaGraph, ncol=2)


