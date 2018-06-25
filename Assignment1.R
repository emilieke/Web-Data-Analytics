
install.packages("arules", dependencies=TRUE)

library(arules)

setwd("C:/Users/pt1a704.AIG.004/Documents/R")

load("titanic.raw.rdata")

str(titanic.raw)

idx <- sample(1:nrow(titanic.raw), 5)

titanic.raw[idx, ]

summary(titanic.raw)

rules.all <- apriori(titanic.raw)

inspect(rules.all)

rules <- apriori(titanic.raw,control = list(verbose=FALSE), parameter = list(minlen=2, supp=0.005, conf=0.8),
                 appearance = list(rhs=c("Survived=No", "Survived=Yes"),default="lhs"))

rules.sorted <- sort(rules, by="lift")
inspect(rules.sorted)


rules.1 <- apriori(titanic.raw, 
                   control = list(verbose=FALSE),
                   parameter = list(minlen=4, supp=0, conf=0),
                   appearance = list(lhs=c("Sex=Female","Age=Child","Class=3rd"),rhs=c("Survived=Yes"),default="none"))

inspect(rules.1)

rules.2 <- apriori(titanic.raw, 
                   control = list(verbose=FALSE),
                   parameter = list(minlen=4, supp=0, conf=0),
                   appearance = list(lhs=c("Sex=Female","Age=Child","Class=1st"),rhs=c("Survived=Yes"),default="none"))

inspect(rules.2)


rules.3 <- apriori(titanic.raw,
                 control = list(verbose=FALSE),
                 parameter = list(minlen=3, maxlen=3, supp=0.07, conf=0.75),
                 appearance = list(rhs=c("Survived=No","Survived=Yes"),
                                   default="lhs"))

rules.3.sorted <- sort(rules.3, by="confidence")
inspect(rules.3.sorted)

