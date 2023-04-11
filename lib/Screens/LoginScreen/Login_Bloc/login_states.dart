 abstract class LoginStates{}



 // Here we are Creating the IntitialState Bloc
 class IntitialState extends LoginStates{
 }

 // This Is the Valid State
 class ValidState extends LoginStates{}



 // This Error State
 class ErrorState extends LoginStates{
  String errorMessage;
  ErrorState(this.errorMessage);

 }

 // This state is when user click on login button
 class LoginLoadingState extends LoginStates{}

