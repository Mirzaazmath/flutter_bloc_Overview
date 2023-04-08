// here we are creating the abstract class
abstract class InternetEvent{}


/*
Note that we have  created two event class that are two diffrent classes
this may cause some issue that why we have  create a connection between this class
by extending them with a class called Internet Event
*
* */


 // here we are creating the the Internet lost event class
class InternetLostEvent extends InternetEvent{}




 // here we are creating the the Internet gain event class
class InternetGainEvent extends InternetEvent{}