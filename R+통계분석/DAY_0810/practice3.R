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

