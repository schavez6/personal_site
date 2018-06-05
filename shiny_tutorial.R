

install.packages('rsconnect')
rsconnect::setAccountInfo(name='schavez', token='F5D08BF684CEB0BAC3081F84BEBE4411', secret='lybcBWWniZw+Q9kL78zum9dgGzFvYEiSaUGGjNnW')
library(rsconnect)
setwd("~/UO/Spring 2018/Data Science/personal_site/shinythings/shinytest/")
rsconnect::deployApp()
