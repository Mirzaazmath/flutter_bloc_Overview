 abstract class LoginEvents{}


 // here we are Creating the Event on text change
 class LoginTextChangeEvent extends LoginEvents {
  String emailvalue;
  String passwordvalue;

  LoginTextChangeEvent(this.emailvalue, this.passwordvalue);
 }


// here we are Creating the Event for Submit Button
 class LoginSubmitEvent extends LoginEvents{
 String email;
 String password;
 LoginSubmitEvent(this.email,this.password);

 }