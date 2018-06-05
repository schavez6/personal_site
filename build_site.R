#Set our working directory. 
#This helps avoid confusion if our working directory is 
#not our site because of other projects we were 
#working on at the time. 
setwd("~/UO/Spring 2018/Data Science/personal_site")

#render your site.  i like to do this frequently.
# check the index.html file to see if your website.
# Make sure it looks the way you intended after each change.
# If it looks awesome, push changes to github.
rmarkdown::render_site()

