library(twitteR)

options(httr_oauth_cache=T)
consumer_key <- 'SflkBfHx6V371jXMOXmSb4uNz'
consumer_secret <- 'wBXcbVKXyCyILqqaJkNH66ZmVOdABlpuEwXjabTnq0eEQIgrid'
access_token <- '824337376721911808-ggbcztgp2ZzjBc9mg9rjINK0pTYyGZn'
access_secret <- '98jf3q65e7T1C4jveKYFipFcextxt6RcB88O4wgbH34Zi'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

HondaTweets <- searchTwitter("toyota", n=50000, lang="en", since="2000-01-01")
HondaTweets <- twListToDF(HondaTweets)
write.csv(HondaTweets, file = "C:\\DataScienceAndAnalytics\\SocialMedia\\GroupProject\\HondaTweets.csv")

ToyotaTweets <- searchTwitter("toyota", n=50000, lang="en", since="2000-01-01")
ToyotaTweets <- twListToDF(ToyotaTweets)
write.csv(ToyotaTweets, file = "C:\\DataScienceAndAnalytics\\SocialMedia\\GroupProject\\ToyotaTweets.csv")
