part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class SignupRequested extends AuthenticationEvent{

final String name;
final String email;
final String password;
final String source;

SignupRequested({
  required this.name,
  required this.email,
  required this.password,
  required this.source
});




}
class LogoutRequested extends AuthenticationEvent{}

class GoogleLoginRequested extends AuthenticationEvent {}


class LoginRequested extends AuthenticationEvent{
  final String email;
  final String password;
  final String source;

  LoginRequested(
      {required this.email, required this.password, required this.source});

}

class CheckAuthenticationstatus extends AuthenticationEvent{}

  class AuthenticationstatusChanged extends AuthenticationEvent{
    final bool isAuthenticated;

    AuthenticationstatusChanged({required this.isAuthenticated});
  }
