part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

// Login with credentials
class Login extends LoginEvent {
  final String email;
  final String password;

  Login({this.email, this.password});
}

class Logout extends LoginEvent {}
