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
#discount, offer, finance, lease
HondaTweets$marketing <- ifelse(grepl("discount", HondaTweets$text,ignore.case = TRUE),1, 
                               ifelse(grepl("offer", HondaTweets$text,ignore.case = TRUE),1, 
                                      ifelse(grepl("finance", HondaTweets$text,ignore.case = TRUE),1, 
                                              ifelse(grepl("lease", HondaTweets$text,ignore.case = TRUE),1, 0))))

HondaTweetsMarketing <- HondaTweets[!HondaTweets$BodyType == "-" ,]
HondaTweetsMarketing <- HondaTweetsMarketing[HondaTweetsMarketing$marketing == 1 ,]

HondaGraph <- ggplot(data=HondaTweetsMarketing, aes(factor(HondaTweetsMarketing$BodyType))) + 
  geom_bar(stat="count", fill = "blue") +
  ylab("Count") + xlab("Honda Marketing") +
  theme(text=element_text(size=14,face="bold")) 
  

#--------- Toyota
ToyotaTweets$BodyType <- ifelse(grepl("hatchback", ToyotaTweets$text,ignore.case = TRUE),"Hatchback", 
                               ifelse(grepl("wagon", ToyotaTweets$text,ignore.case = TRUE),"Wagon", 
                                      ifelse(grepl("suv", ToyotaTweets$text,ignore.case = TRUE),"SUV", 
                                             ifelse(grepl("crossover", ToyotaTweets$text,ignore.case = TRUE),"Crossover", 
                                                    ifelse(grepl("coupe", ToyotaTweets$text,ignore.case = TRUE),"coupe", 
                                                           ifelse(grepl("sport", ToyotaTweets$text,ignore.case = TRUE),"Sport", '-'))))))
#discount, offer, finance, lease
ToyotaTweets$marketing <- ifelse(grepl("discount", ToyotaTweets$text,ignore.case = TRUE),1, 
                                ifelse(grepl("offer", ToyotaTweets$text,ignore.case = TRUE),1, 
                                       ifelse(grepl("finance", ToyotaTweets$text,ignore.case = TRUE),1, 
                                              ifelse(grepl("lease", ToyotaTweets$text,ignore.case = TRUE),1, 0))))

ToyotaTweetsMarketing <- ToyotaTweets[!ToyotaTweets$BodyType == "-" ,]
ToyotaTweetsMarketing <- ToyotaTweetsMarketing[ToyotaTweetsMarketing$marketing == 1 ,]

ToyotaGraph <- ggplot(data=ToyotaTweetsMarketing, aes(factor(ToyotaTweetsMarketing$BodyType))) + 
  geom_bar(stat="count", fill = "blue") +
  ylab("Count") + xlab("Toyota Marketing") +
  theme(text=element_text(size=14,face="bold")) 


# draw graph
grid.arrange(HondaGraph, ToyotaGraph, ncol=2)


