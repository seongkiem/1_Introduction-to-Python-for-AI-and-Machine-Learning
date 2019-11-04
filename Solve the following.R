### 1
A<-data.frame(longley$GNP.deflator,longley$Employed)
B<-data.frame(longley$GNP,longley$Employed)
C<-data.frame(longley$Unemployed,longley$Employed)
D<-data.frame(longley$Armed.Forces,longley$Employed)
E<-data.frame(longley$Population,longley$Employed)
F<-data.frame(longley$Year,longley$Employed)


### 2
plot(A)
plot(B)
plot(C)
plot(D)
plot(E)
plot(F)

cor(A)[1,2]#0.9708985
cor(B)[1,2]#0.9835516
cor(C)[1,2]#0.5024981
cor(D)[1,2]#0.4573074
cor(E)[1,2]#0.9603906
cor(F)[1,2]#0.9713295

#Answer: GNP, Year and GNP.deflator are the 3 variables that are highly correlated to Employed.


### 3
summary(lm(B[,2]~B[,1]))
#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 51.843590   0.681372   76.09  < 2e-16 ***
#  B[, 1]       0.034752   0.001706   20.37 8.36e-12 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 0.6566 on 14 degrees of freedom
#Multiple R-squared:  0.9674,	Adjusted R-squared:  0.965 
#F-statistic: 415.1 on 1 and 14 DF,  p-value: 8.363e-12

summary(lm(F[,2]~F[,1]))
#Coefficients:
#Estimate Std. Error t value Pr(>|t|)    
#(Intercept) -1.335e+03  9.161e+01  -14.57 7.44e-10 ***
#  F[, 1]       7.165e-01  4.687e-02   15.29 3.96e-10 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 0.8642 on 14 degrees of freedom
#Multiple R-squared:  0.9435,	Adjusted R-squared:  0.9394 
#F-statistic: 233.7 on 1 and 14 DF,  p-value: 3.958e-10

summary(lm(A[,2]~A[,1]))
#Coefficients:
#Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 33.18917    2.12919   15.59 3.06e-10 ***
#  A[, 1]       0.31597    0.02083   15.17 4.39e-10 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 0.8706 on 14 degrees of freedom
#Multiple R-squared:  0.9426,	Adjusted R-squared:  0.9385 
#F-statistic: 230.1 on 1 and 14 DF,  p-value: 4.389e-10

# Answer: Model Employed=51.84+0.03475*GNP is the best model among the rest of the models.


### 4
Y=matrix(B[,2],ncol=1)
X=matrix(c(rep(1,16),B[,1]),ncol=2,byrow=FALSE)
# Answer: Model in matrix form is Y=Xb, where b is a matrix of 2 x 1 containing coefficient of regression.


### 5
# Regression Parameters
b=solve(t(X) %*% X) %*% t(X) %*% Y
#             [,1]
#[1,] 51.84358978
#[2,]  0.03475229

# Predicted Values
X%*%b
#          [,1]
#[1,] 59.98567
#[2,] 60.85924
#[3,] 60.81156
#[4,] 61.73406
#[5,] 63.27623
#[6,] 63.90260
#[7,] 64.54156
#[8,] 64.46256
#[9,] 65.65655
#[10,] 66.41106
#[11,] 67.23083
#[12,] 67.29258
#[13,] 68.61866
#[14,] 69.31013
#[15,] 69.85129
#[16,] 71.12743