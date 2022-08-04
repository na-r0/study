# 연습문제 3.1
# 정사각형 넓이
x <- c(5,10,15)
x^2
# 원의 둘레, 원의 넓이
r <- c(5,10,15)
2*r*3.14
(r^2)*3.14

# 연습문제 3.3
# n^3+(n-1)^3+...+2^3+1^3
n <- c(10,15,20)
s <- c()
for (i in n){
  total <-0
  for (j in (1:i)){
    total <- total+j^3
  }
  s <- c(s,total)
}
s

# 연습문제 3.4
n <- 15
pizza <- 0
chicken <- 0
combo <- 0
diet <- 0

for (i in (1:n)){
  if (i%%15==0){
    order <- '피자나라치킨공주'
    combo <- combo+1
  } else if (i%%3==0){
    order <- '피자'
    pizza <- pizza+1
  } else if (i%%5==0){
    order <- '치킨'
    chicken <- chicken+1
  } else{
    order <- '다이어트'
    diet <- diet+1
  }
  cat(i,order,'\n')
}
cat('pizza =',pizza,'\n')
cat('chicken =',chicken,'\n')
cat('combo =',combo,'\n')
cat('diet =',diet,'\n')

# 연습문제 3.5
# 별찍기
n <- 5
for (i in (1:n)){
  for (j in (1:n)){
    cat('*')
  }
  cat('\n')
}

for (i in (1:n)){
  for (j in (1:i)){
    cat('*')
  }
  cat('\n')
}

for (i in (1:n)){
  if (i%%2==1){
    for (j in (1:n)){
      cat('*')
    }
  } else{
    cat('*')
  }
  cat('\n')
}

# 연습문제 3.6
n <- c(100)
s <- c()
is.prime <- TRUE
for (j in 2:(n-1)){
  for (i in 2:(n-1)){
    if (n%%i==0){
      is.prime <- FALSE
      break
    }
  }
}
is.prime

length(s)

# 연습문제 3.7
n <- c(10)
v <- 1:n
maxval <-c()
for (i in (1:n)){
  cat(i,':',length(v[i%%v==0]),'\n')
  maxval <- c(maxval,length(v[i%%v==0]))
}
maxval

# 연습문제 4.1
# 1-15 약수 개수
n <- 15
div <- c()
for (i in (1:n)){
  div <- c(div,length((1:n)[i%%(1:n)==0]))
}
# 약수의 개수가 2인 원소의 개수
sum(div==2)
# 약수의 개수가 2인 원소의 인덱스
which(div==2)

# 연습문제 4.2
height <- c(163,175,182,178,161)
weight <- c(65,87,74,63,51)
blood <- c('A','B','AB','O','A')
lst <- list(height=height,weight=weight,blood=blood)
str(lst)
# 키와 몸무게 평균
mean(lst$height)
mean(lst$weight)
# 혈액형 빈도표
barplot(table(lst$blood), col = 'skyblue',
        main='혈액형 빈도표',
        xlab = '혈액형',
        ylab = '빈도')

