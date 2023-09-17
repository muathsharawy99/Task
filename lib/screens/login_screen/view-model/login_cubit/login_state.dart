abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState{}
class LoginErrorState extends LoginState{}
class LoginLoadingState extends LoginState{}