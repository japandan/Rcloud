## demo of a simple function
my_function<-function(argument) {
  
  if(typeof(argument)=="character"){
    print("That's a string silly!")
    return()
  }
  
  answer<-argument*2
  return(answer)
}

multiply<-function(num1,num2) {
  
  if((typeof(num1)=="character")|(typeof(num2)=="character")){
    print("That's a string silly!")
    return()
  }
  
  answer<-num1*num2
  return(answer)
}



message("calling my_function(2)")
message("This should print out a 4")
message(my_function(2))

message("calling multiply(2,2)")
message("This should print out a 4")
message(multiply(2,2))
