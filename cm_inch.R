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