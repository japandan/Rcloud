## creating data frames using the rep() function
##
suits<-c("hearts","diamonds","clubs","spades")
face<-c("ace","two","three","four","five","six","seven","eight","nine","ten","jack","queen","king")
value<-c(1,2,3,4,5,6,7,8,9,10,11,12,13)
cards_df<-data.frame(face=rep(face,4),suit=rep(suits,13), value=rep(value,4))

#>cards_df[1:4, c('face','value')]
# face value
# 1   ace     1
# 2   two     2
# 3 three     3
# 4  four     4
#
#draw 3 random cards..
#cards_df[sample(52,size=3,replace=FALSE), c('face','suit')]
#> summary(cards_df)
# face          suit        value   
# ace    : 4   clubs   :13   Min.   : 1  
# eight  : 4   diamonds:13   1st Qu.: 4  
# five   : 4   hearts  :13   Median : 7  
# four   : 4   spades  :13   Mean   : 7  
# jack   : 4                 3rd Qu.:10  
# king   : 4                 Max.

