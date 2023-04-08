abstract class InernetState{}



 // here we are creating the Intial State for Internet
class InternetInitailState extends InernetState{}

// here we are creating the state for  Internet Lost
class InternetLostState extends InernetState{}

// Here we are creating the State for Internet gain
class InternetGainState extends InernetState{}




// Note: In Bloc we add events and emit States