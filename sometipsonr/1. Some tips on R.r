## 1. Some tips on R ##
# page 3
test_func = function(x) {
 x^2
 3
}
test_func(4)

# page 4
setwd("D:/data/")	# The path "D:/data/" must be changed to the directory where data files and "useful_function.R" are saved"
source("D:/data/useful_function.R")
head(course_dataset("groundhog.table", sep=','))

# page 5
X = 3
Y = 4
c(X,Y)

print(rep(1,4))
print(rep(2,3))
c(rep(1,4), rep(2,3))

seq(0,10,length=11)
seq(0,10,by=2)

# page 6
X = c(4,6,2,9)
sort(X)

Y = c(1,2,3,4)
o = order(X)
X[o]
Y[o]

data<-cbind(X,Y)


c = 3
c
c(3,4,5)
c(T,F)

# page 7
X = c(4,5,3,6,7,9)
X[c(2,4,6)]
X[seq(2,6, by=2)]


Y = c(4,2,65,3,5)
X[Y>=5]

load("C:/Users/AH/Desktop/regression/heights.Rdata")
#library(alr3)
#data(heights)
head(heights)
subset_heights = heights[heights$Dheight <= 62,]
subset_heights2 = subset(heights, Dheight <= 62)
subset_heights3 = heights[heights[,2] <= 62,]

all.equal(subset_heights, subset_heights2)



print(c(nrow(heights), nrow(subset_heights)))

# page 8
X = c(1:40)
Y = 2 + 3 * X + rnorm(40) * 10
plot(X, Y, pch=23, bg='red', main='A simulated data set', xlab='Predictor', ylab='Outcome')
abline(2, 3, lwd=3, lty=2, col='yellow')
abline(h=60, col='green')
abline(v=20, col='red')

set.seed(101)
ord.X<-sample.int(40, 40)
X<-X[ord.X]
Y<-Y[ord.X]


# page 9
plot(X[1:20], Y[1:20], pch=21, bg='red', xlim=c(min(X),max(X)), ylim=c(min(Y),max(Y)))
points(X[21:40], Y[21:40], pch=21, bg='blue')
lines(X[21:40], Y[21:40], lwd=2, lty=3, col='orange')

# page 10
par(mfrow=c(2,1))
plot(X, Y, pch=21, bg='red')
plot(Y, X, pch=23, bg='blue')
par(mfrow=c(1,1))

setwd("C:/Users/AH/Desktop/regression/")

# page 11
jpeg("myplot.jpg")
plot(X, Y, pch=21, bg='red')
dev.off()

pdf("myplots.pdf")
# make whatever plot you want
# first page
plot(X, Y, pch=21, bg='red')
# a new call to plot will make a new page
plot(Y, X, pch=23, bg='blue')
# close the current "device" which is this pdf file
dev.off()

pch.type<-c(21,23)
col.type<-c("red", "blue")
for (i in 1:2){
jpeg(paste("myplots", i, ".jpg", sep=""))
plot(X, Y, pch=pch.type[i], bg=col.type[i])
dev.off()
}

pch.type<-c(21,23)
col.type<-c("red", "blue")
for (i in col.type){
jpeg(paste("myplots", i, ".jpg", sep=""))
plot(X, Y, pch=21, bg=i)
dev.off()
}


# a new call to plot will make a new page
plot(Y, X, pch=23, bg='blue')
# close the current "device" which is this pdf file
dev.off()





# page 12
for (i in 1:10) {
 print(i^2)
}
for (w in c('red', 'blue', 'green')) {
 print(w)
}

# page 13
help(t.test)
help.search('t.test')
example(lm)

# page 14
qnorm(0.975)
qf(0.95, 2, 40)
1 - pf(5, 2, 40)

# page 15
c(1 - pchisq(5*2, 2), 1 - pf(5, 2, 4000))