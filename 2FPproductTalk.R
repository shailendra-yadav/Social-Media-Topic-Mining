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

HondaTweets$BodyType <- ifelse(grepl("hatchback", HondaTweets$text,ignore.case = TRUE),"Hatchback", 
                               ifelse(grepl("wagon", HondaTweets$text,ignore.case = TRUE),"Wagon", 
                                      ifelse(grepl("suv", HondaTweets$text,ignore.case = TRUE),"SUV", 
                                             ifelse(grepl("crossover", HondaTweets$text,ignore.case = TRUE),"Crossover", 
                                                    ifelse(grepl("coupe", HondaTweets$text,ignore.case = TRUE),"coupe", 
                                                           ifelse(grepl("sport", HondaTweets$text,ignore.case = TRUE),"Sport", '-'))))))



HondaTweetsBodyTypes <- HondaTweets[!HondaTweets$BodyType == "-" ,]

HondaGraph <- ggplot(data=HondaTweetsBodyTypes, aes(factor(HondaTweetsBodyTypes$BodyType))) + 
  geom_bar(stat="count", fill = "blue") +
  ylab("Count") + xlab("Honda Customers Talk") +
  theme(text=element_text(size=14,face="bold")) 
  

#--------- Toyota
ToyotaTweets$BodyType <- ifelse(grepl("hatchback", ToyotaTweets$text,ignore.case = TRUE),"Hatchback", 
                               ifelse(grepl("wagon", ToyotaTweets$text,ignore.case = TRUE),"Wagon", 
                                      ifelse(grepl("suv", ToyotaTweets$text,ignore.case = TRUE),"SUV", 
                                             ifelse(grepl("crossover", ToyotaTweets$text,ignore.case = TRUE),"Crossover", 
                                                    ifelse(grepl("coupe", ToyotaTweets$text,ignore.case = TRUE),"coupe", 
                                                           ifelse(grepl("sport", ToyotaTweets$text,ignore.case = TRUE),"Sport", '-'))))))



ToyotaTweetsBodyTypes <- ToyotaTweets[!ToyotaTweets$BodyType == "-" ,]

ToyotaGraph <- ggplot(data=ToyotaTweetsBodyTypes, aes(factor(ToyotaTweetsBodyTypes$BodyType))) + 
  geom_bar(stat="count", fill = "blue") +
  ylab("Count") + xlab("Toyota Customers Talk") +
  theme(text=element_text(size=14,face="bold")) 


# draw graph
grid.arrange(HondaGraph, ToyotaGraph, ncol=2)


