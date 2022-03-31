bank.df <- read.csv("UniversalBank.csv")
bank.df <- bank.df[ , -c(1,5)]
# treat Education as a categorical (R creates dummy variable)
bank.df$Education <- factor(bank.df$Education, levels = c(1,2,3),
                            labels = c("Undergrad", "Graduate", "Advanced/Professional"))
#partion data
set.seed(2)
train.index <- sample(c(1:dim(bank.df)[1]), dim(bank.df)[1]*0.6)
train.df <- bank.df[train.index, ]
valid.df <- bank.df[-train.index, ]

#run logistic regression
#use glm (general linear model) with family = "binomial" to fit a logisitic regression
logit.reg <- glm(Personal.Loan ~ ., data = train.df, family = "binomial")
options(scipen = 999)
summary(logit.reg)
