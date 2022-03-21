## 2. SIMPLE LINEAR REGRESSION ##
# page 12
load("D:/regression/data/wages.Rdata")
attach(wages)
wages.lm = lm(logwage ~ education)
plot(education, logwage, pch=23, bg='red', cex=2, cex.lab=3)
abline(wages.lm, lwd=4, col='black')

# page 13
beta.1.hat = cov(education, logwage) / var(education)
beta.0.hat = mean(logwage) - beta.1.hat * mean(education)
print(c(beta.0.hat, beta.1.hat))
print(coef(wages.lm))

# page 15
sigma.hat = sqrt(sum(resid(wages.lm)^2) / wages.lm$df.resid)
sigma.hat
summary(wages.lm)

# page 25
SE.beta.1.hat = (sigma.hat * sqrt(1 / sum((education - mean(education))^2)))
Tstat = beta.1.hat / SE.beta.1.hat
data.frame(beta.1.hat, SE.beta.1.hat, Tstat)
summary(wages.lm)

2*(1 - pt(Tstat, wages.lm$df.resid))
detach(wages)

# page 26
load("D:/regression/data/heights.Rdata")
M = heights$Mheight
D = heights$Dheight
alpha = 0.05
n = length(M)
qt(1-0.5*alpha,n-2)
qnorm(1-0.5*alpha)

L = beta.1.hat - qt(0.975, wages.lm$df.resid) * SE.beta.1.hat
U = beta.1.hat + qt(0.975, wages.lm$df.resid) * SE.beta.1.hat
data.frame(L, U)

confint(wages.lm)

# page 27
height.lm = lm(D~M)
predict(height.lm, list(M=c(66,60)), interval='confidence', level=0.90)

# page 29
predict(height.lm, list(M=66), interval='prediction', level=0.90)	