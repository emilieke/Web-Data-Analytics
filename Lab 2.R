install.packages("igraph")
library("igraph")

setwd("/Users/Emilie/Dropbox/Skole/UC3M/Web Data Analytics")


# The graph
n<-read.graph("references.tsv",format="ncol",directed=TRUE)


i<-which(V(n)$name=="/conf/adbis/SchwarzTS99")

V(n)[i]

# number of vertices
vcount(n)

# number of edges
ecount(n)


# Exercise 1

?neighbors

neighbors(n, "/conf/sigmod/CopelandK85", mode = c("all"))

# Exercise 2

?degree

# The degree of a vertex is its most basic structural property, 
# the number of its adjacent edges

# the number of outgoing edges from the vertice "/conf/sigmod/CopelandK85" = 23
degree(n, "/conf/sigmod/CopelandK85", "out")

# the number of ingoing edges to a set of (vector) of vertices v
degree(n, v=c("/conf/sigmod/CopelandK85","/journals/cacm/Press92a"), mode="in")

# the maximum number of ingoing edges from the set of vertices in the graph
max(degree(n, v=V(n), mode="in"))          

# the total degree (in and outgoing) for all nodes in graph n
d<-degree(n);d

str(V(n))
# Exercise 3
d<-degree(n,mode="in")
i<-which(d==max(degree(n, v=V(n), mode="in")));i
V(n)[i]

# Exercise 4
c<-closeness(n)
i<-which(c==max(closeness(n)))
V(n)[i]

b<-betweenness(n);b
i<-which(b==max(betweenness(n)))
V(n)[i]

# Exercise 5
pr<-page.rank(n)
which(pr$vector == max(pr$vector)) 

hs<-hub.score(n);hs
as<-authority.score(n);as

which(hs$vector == max(hs$vector)) 
which(as$vector == max(as$vector))

# What would you use (hubs/authorities) in case you where looking for survey papers in the state of the art?
# authority because it is the one that is pointed to by many other papers 