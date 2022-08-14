# chap1

levels(survey$W.Hnd) # 범주형 

freq.tab <- table(survey$W.Hnd)
freq.tab

freq.prop <- prop.table(freq.tab)
freq.prop

length(survey$Height)
mean(survey$Height)
mean(survey$Height,na.rm = T)
quantile(survey$Height,probs = 0.9,na.rm = T)



library(stargazer)
stargazer(survey,type='text',title='S')


aggregate(survey$Pulse, by=list(survey$Exer ), FUN=mean , na.rm=T)

library(vcd)
xtabs(~Improved+Treatment,data=Arthritis)


mosaic(Improved ~ Treatment,data=Arthritis,gp=shading_max)



cross.tab <- with(Arthritis,table(Improved, Treatment))
cross.tab
margin.table(cross.tab,margin = 1)
margin.table(cross.tab,margin = 2)


#chap3

# 표준정규분포
x <- seq(-3,3,length=200)
x
plot(x,dnorm(x,mean=0,sd=1),type = 'l',main='Normal Distribution')


pnorm(35000,30000,10000) - pnorm(25000,30000,10000)



# $25,000~$35,000 사이에 없을 확률 그래프
x <- seq(10000,50000,length=200)
y <- dnorm(x, mean=30000, sd=10000)
plot(x,y,type='l',main='$25,000~$35,000 사이에 없을 확률')
xlim1 <- x[25000>=x]
xlim2 <- x[x>=35000]
ylim1 <- y[25000>=x]
ylim2 <- y[x>=35000]

xlim1 <- c(xlim1[1],xlim1,tail(xlim1,1))
xlim1
ylim1 <- c(0,ylim1,0)
ylim1
polygon(xlim1,ylim1,col='grey')

xlim2 <- c(xlim2[1],xlim2,tail(xlim2,1))
xlim2
ylim2 <- c(0,ylim2,0)
ylim2
polygon(xlim2,ylim2,col='grey')





# 연습문제
# 수학이 70 점이고 영어가 80 점인 학생은 어느 과목을 더 잘할까
# 단 , 수학 점수점수~𝑁(60,10^2), 영어 점수점수~𝑁(70,20^2)

1-pnorm(70,60,10)
1-pnorm(80,70,20)

z1 <- (70-60)/10
z2 <- (80-70)/20
z1
z2

# 수학 상위 15%, 영어 상위 30%
1-pnorm(z1)
1-pnorm(z2)





# 연습문제
# 동전의 앞면이 나올 확률이 0.5 일 때 동전 던지기를 100 회 시행했다
# 동전이 앞면이 나오는 횟수를 𝑋라고 할 때 확률분포의 그래프


n_sim <- 10000
y <- rbinom(n_sim,100,0.5)

hist(y,xlab='X',ylab='mass',main='B(100,0.5)',prob=T,breaks=30)

curve(dnorm(x,50,5),25,75,lty=2,lwd=2,col='red',add=T)


# chap 4
# 이항분포
# 𝑋: 공평한 동전 던지기를 size번 실행했을 때 앞면이 나온 횟수 
set.seed(2022)
rbinom(n=1,size=1,prob=0.5)
rbinom(n=1,size=10,prob=0.5)

x <- rbinom(n=10000,size=100,prob=0.5)
hist(x,col='skyblue',breaks = 15)

# 정규분포
# 𝑋~𝑁(172, 10^2): 경북대 대학원 학생들의 키
set.seed(2022)
x <- rnorm(n=1000,mean=172,sd=10)
hist(x,col='skyblue',breaks = 30,freq = F)
x <- seq(min(x),max(x),length.out=200)
curve(dnorm(x,172,10),add=T,col='tomato',lwd=2)

# 𝑋~𝑁(172,10^2)일 때 
# 1. 어떤 대학원 학생의 키가 160보다 크거나 180보다 작을 확률은?
pnorm(q=160,mean = 172, sd=10)
pnorm(q=160,mean = 172, sd=10,lower.tail = F)
pnorm(q=180,mean = 172, sd=10)
pnorm(q=180,mean = 172, sd=10,lower.tail = F)

1 - pnorm(160,172,10) - pnorm(180,172,10,lower.tail = F)

# 2. 상위 5% 또는 하위 5%에 속하는 대학원생의 키는?
qnorm(p=0.05,mean=172,sd=10)
qnorm(p=0.05,mean=172,sd=10,lower.tail = F)

qnorm(c(0.05,0.95),172,10)
qnorm(c(0.025,0.975),172,10)
qnorm(c(0.005,0.995),172,10)

# 표준 정규분포 Z~N(0,1)
x <- seq(from=-3,to=3,length.out=200)
plot(x,dnorm(x),type='l',col='tomato',lwd=2)

# 모집단과 표본집단
x <- 1:9
sample(x,size=7)
sample(x,size=10)
sample(x,size=10,replace = T)

# 중심극한정리
x.norm <- rnorm(n=10000,mean=50,sd=25)
hist(x.norm,col = 'orange',freq=F,ylim=c(0,0.02))
mean(x.norm)
sd(x.norm)

x.bar <- c()
for (i in 1:10000){
  x.bar <- c(x.bar, mean(sample(x.norm,size=100)))
}
hist(x.bar,col='skyblue',freq=F)

x.unif <- runif(n=10000,min=0,max=100)
hist(x.unif,col='tomato',freq=F,ylim=c(0,0.02))
mean(x.unif)
sd(x.unif)

x.bar <- c()
for (i in 1:10000){
  x.bar <- c(x.bar,mean(sample(x.unif,size=100)))
}
hist(x.bar,col = 'cyan3',freq=F)



# chap 5
height <- survey$Height
h.mean <- mean(height, na.rm=T)
h.mean

h.sd <- sd(height, na.rm = T)
h.sd

c(h.mean-1.96*h.sd, h.mean+1.96*h.sd)
pnorm(191.6820,mean=h.mean,sd=h.sd,lower.tail = F)


x <- seq(h.mean-3*h.sd,h.mean+3*h.sd,length.out=200)
y <- dnorm(x,h.mean,h.sd)
plot(x,y,type = 'l',col='lightgrey',lwd=2)
abline(0,0,col='lightgrey',lwd=2)
lower <- h.mean-1.96*h.sd
upper <- h.mean+1.96*h.sd
xlim <- x[lower<=x&x<=upper]
ylim <- y[lower<=x&x<=upper] - 0.0001
xlim <- c(xlim[1],xlim,tail(xlim,1))
ylim <- c(0,ylim,0)
polygon(xlim,ylim,col='lightgrey')



shapiro.test(survey$Height)
shapiro.test(survey$Age)

set.seed(2022)
x.unif <- runif(100,min=0,max=100)
x.norm <- rnorm(100,mean(x.unif),sd(x.unif))

shapiro.test(x.unif)
shapiro.test(x.norm)

par(mfrow=c(1,2))
qqnorm(x.unif,col='tomato',main='Uniform Dist')
qqline(x.unif)
qqnorm(x.norm,col='steelblue',main='Normal Dist')
qqline(x.norm)
par(mfrow=c(1,1))



# chap 6
# t-분포의 자유도 차이에 따른 그래프 모양
x <- seq(-3,3,length=200)
curve(dt(x,df=30),min(x),max(x),lty=1,lwd=3,col='darkblue',
      main='PDF of t-dist',xlab='t',ylab='density')
curve(dt(x,df=5),min(x),max(x),lty=2,lwd=3,col='violet',add = T)
curve(dt(x,df=1),min(x),max(x),lty=3,lwd=3,col='tomato',add = T)
legend('topright',legend=c('df=30','df=5','df=1'),
       col=c('darkblue','violet','tomato'),lty=c(1,2,3))







