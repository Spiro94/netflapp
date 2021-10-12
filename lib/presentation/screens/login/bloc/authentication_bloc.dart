import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/respository/user_respository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  UserRepository userRepository;
  AuthenticationBloc(this.userRepository) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is AppStarted) {
        bool result = await userRepository.hasSessionActive();
        if (result) {
          emit(AuthenticationAuthenticated());
        } else {
          emit(AuthenticationUnauthenticated());
        }
      }
      if (event is LogInButtonPressed) {
        emit(AuthenticationLoading());
        if (event.username.isEmpty || event.password.isEmpty) {
          emit(const AuthenticationAuthenticationFailed(
              'Empty text fields. No valid data.'));
        } else {
          bool result = await userRepository.logIn(
              username: event.username, password: event.password);
          if (result) {
            emit(AuthenticationAuthenticated());
          } else {
            emit(const AuthenticationAuthenticationFailed(
                'Invalid password or username'));
          }
        }
      }
      if (event is LogOutButtonPressed) {
        emit(AuthenticationLoadingLogOut());
        await userRepository.logOut();
        emit(AuthenticationUnauthenticated());
      }
    });
  }
}
