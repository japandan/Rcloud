# BIFX551 Assignment 1/28/2020 
# Author: Daniel Vogel
# Write your own function to convert between any two units. 
# The function should take two arguments, a number, and an argument
# specifying the direction of the conversion. 
# Include your function with documentation string in an R-markdown file 
#
# function to convert between cm and inch
# Usage: cm_inch( length, direction) where direction={ "tocm" or "toinch"}
#
cm_inch<-function(length, direction="required"){
  if (direction == "tocm"){
    length * 2.54
  } else if (direction == "toinch") {
    length / 2.54
  } else {
    message('Usage: cm_inch( length, ',dQuote("tocm"),"|",dQuote("toinch"),')')
    NULL
  }
}
