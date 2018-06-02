#Set our working directory. 
#This helps avoid confusion if our working directory is 
#not our site because of other projects we were 
#working on at the time. 
setwd("~/UO/Spring 2018/Data Science/personal_site")

#render your sweet site. 
rmarkdown::render_site()
