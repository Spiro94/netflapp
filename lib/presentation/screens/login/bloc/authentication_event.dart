part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LogInButtonPressed extends AuthenticationEvent {
  final String username;
  final String password;

  const LogInButtonPressed(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class LogOutButtonPressed extends AuthenticationEvent {}
