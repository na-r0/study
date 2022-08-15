
# 산점행렬도
library(GGally)
ggpairs(df)





# 'twowayanova.xlsx' 예제를 이용한 이원분산분석
library(DescTools)
library(lawstat)

df <- read_excel('./twowayanova.xlsx')
str(df)

# 1. 이원분산분석
model <- aov(price ~ smoke*area, data=df)
summary(model)

# 2. 사후검정
ScheffeTest(model)

# 3. 상호작용효과 사후검정 결과 선도표 확인
interaction.plot(df$smoke,df$area,df$price)

# 4. 정규성검정
# smoke 그룹 price
smokeO <- df[df$smoke=='smokeO',3]
smokeX <- df[df$smoke=='smokeX',3]
smokeT <- df[df$smoke=='smokeT',3]

shapiro.test(smokeO$price)
shapiro.test(smokeX$price)
shapiro.test(smokeT$price)

# area 그룹 price
hongUniv <- df[df$area=='hongUniv',3]
jongro <- df[df$area=='jongro',3]
kangnam <- df[df$area=='kangnam',3]

shapiro.test(hongUniv$price)
shapiro.test(jongro$price)
shapiro.test(kangnam$price)

# 5. 잔차의 정규성 검정
shapiro.test(resid(model))

# 6. 등분산성 검정
# (1). lawstat 패키지 사용
levene.test(df$price,interaction(df$smoke,df$area))

# (2). car 패키지 사용
leveneTest(price ~ smoke*area,data=df)






# 'slreg.xlsx' 예제를 이용한 단순선형회귀분석
# 키에 따른 몸무게 변화
# 독립변수: 키, 종속변수: 몸무게

library(readxl)
library(lmtest)
library(car)

df <- read_excel('./slreg.xlsx')
str(df)

x <- df$heig # 독립변수
y <- df$weig # 종속변수

# 1. 상관관계 분석
cor.test(x,y)

# 2. 산점도 그래프
plot(x,y,pch=19,col='steelblue')

# 3. 단순선형회귀 분석
library(lmtest)
slreg <- lm(y~x)
summary(slreg)

# 4. 결과 그래프 - 2. 산점도에 회귀선 추가
abline(slreg,col='tomato',lwd=2)






# 'mlreg.xlsx' 예제를 이용한 다중선형회귀분석
# 여러 독립변수들에 따른 살인사건 발생률
df <- read_excel('./mlreg.xlsx')

x.1 <- df$popu
x.2 <- df$inco
x.3 <- df$illi
x.4 <- df$frost
y <- df$murd

# 1. 상관관계 분석
cor.test(x.1,y)
cor.test(x.2,y)
cor.test(x.3,y)
cor.test(x.4,y)

# 2. 다중선형회귀분석
model <- lm(y ~ x.1+x.2+x.3+x.4)
summary(model)

# 3. 유의한 독립변수로 다시 함수 생성
re.model <- lm(y ~ x.1+x.3)
summary(re.model)

# 4. 정규성 검정
shapiro.test(model$residuals)

# (1). 잔차의 정규성 검정
plot(model,2)

# 5. 등분산 검정
ncvTest(model)
# 그래프의 점들이 불규칙하게 분포되어 있는지 확인
plot(model,3)
spreadLevelPlot(model)















