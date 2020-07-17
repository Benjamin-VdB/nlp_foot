library(jsonlite)
library(openxlsx)

url <- 'http://api.blog-foot.com/request/2017-01-01/2018-10-10'

c <- fromJSON(url)
c[1,"title"]
c[1,"h1"]
c[1,"chapeau"]
c[1,"text"]

write.csv(c,'/home/ben/Documents/data/lequipe2017_18.csv')
write.xlsx(c,'/home/ben/Documents/data/lequipe2017_18.xlsx')
write(c$text,'/home/ben/Documents/data/text_blog.txt')
