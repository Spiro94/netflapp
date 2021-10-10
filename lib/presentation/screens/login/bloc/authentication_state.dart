part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationLoadingLogOut extends AuthenticationState {}

class AuthenticationAuthenticationFailed extends AuthenticationState {
  final String message;

  const AuthenticationAuthenticationFailed(this.message);

  @override
  List<Object> get props => [message];
}
