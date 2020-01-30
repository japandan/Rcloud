## function to convert japanese Year Era format to Gregorian format
#
# Japanese years are prefixed by a letter to designate the dynasty name
# The letter is followed by 2 digits for the year of that dynasty
# The dynasty list is:
#  Era          Date-Range              Unicode for kanji
#  R    reiwa   2019-05-01 - present    U+32FF
#  H    hesei   1989-01-08 - 2019-04-30 U+337B
#  S    showa   1926-12-25 - 1989-01-07 U+337C
#  T    taisho  1912-07-30 - 1926-12-24 U+337D
#  M    meiji   1868       - 1912-07-29 U+337E
library(stringi)
library(graphics)
#
era_date<-function( inputdate="empty", direction=NULL ){
  if ( inputdate == "empty" ){
    message('Error: Please specify a date string in format YYYY-MM-DD or {era}YY-MM-DD')
    message('Valid values for the {era} are R, H, S, T, M')
    message('Usage: era_date("date-string", "greg"|"era" )\n')
  
    R<-stri_unescape_unicode(paste0("\\u","4ee4","\\u","548C"))  # this char requires Unicode v12.1 
    H<-stri_unescape_unicode(paste0("\\u","337B"))
    S<-stri_unescape_unicode(paste0("\\u","337C"))
    T<-stri_unescape_unicode(paste0("\\u","337D"))
    M<-stri_unescape_unicode(paste0("\\u","337E"))
    o<-stri_unescape_unicode(paste0("\\u","014D"))
    message("Codes for {era}")
    message("R: Reiwa  ", R)
    message("H: Hesei  ",H)
    message("S: Sh",o,"wa  ", S)
    message("T: Taish",o," ",T)
    message("M: Meiji  ", M)
    
    message('\nExample: era_date( "H30-10-01", "greg") " Corresponds to Year Hesei 40 October, 1st')
    message('Example: era_Date( "1965-10-01", "era") Corresponds to Gregorian date Oct 1st, 1965')
  }
  
  
  
}
