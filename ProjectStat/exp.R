#Statistical Inference - Project - Claudio Bogazzi

In this markdown file I am going to investigate the exponential distribution and 
compare it with the Central Limit Theorem.
First, let us define our exponential distribution

```{r}
lambda <- 0.2
size <- 40 #size of the sample
#mean and sd of the exponential distribution are defined as 1/lambda
mean <- 1/lambda
std <- 1/lambda

#let's have a look at the exp distribution
set.seed(123)
exp_dist <- rexp(10000, lambda)
h <- hist(exp_dist, breaks=50,main="Exponential distribution with lambda = 0.2")
```
Pretty, eh? Now we have to simulate the distribution of the mean of 40 exponentials.

```{r}
#average of 40 exponentials
nsim = 1000
exp2 <- matrix(rexp(nsim*size, rate=lambda), nsim, size)
Avexp2 <- rowMeans(exp2)
```

1: Show the sample mean and compare it to the theoretical mean of the distribution.

```{r}
#mean of new distribution and comparison with theoretical mean
smean = mean(Avexp2)
print("The sample mean is: ", smean)
print("The theoretical mean is: ", mean)

```
#mean of the distribution of the average of 40 exponentials is close to the theoretical mean (as expected)

#I compute now the theoretical standard deviation of sample means (theo_sd) and compare 
#with the actual standard deviation of the sample means (ssd). 
theo_sd <- std / sqrt(size)
ssd <- sd(Avexp2)
ssd; theo_sd

#As you can see the standard deviation of the averages is close to the theoretical standard deviation 

#Now I show that the distribution of the averages of 40 exponential is approximately normal
#The two vertical lines show the sample and theoretical mean

hist(Avexp2, breaks=50,main="Distribution of averages of 40,
     exponential distributions with lambda=0.2")
abline(v=smean,col=3,lty=1)
abline(v=mean, col=2, lty=1)

qqnorm(Avexp2); qqline(Avexp2)


