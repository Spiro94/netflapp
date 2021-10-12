import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:netflapp/domain/respository/user_respository.dart';
import 'package:netflapp/presentation/screens/login/bloc/authentication_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository repository;
  late AuthenticationBloc bloc;

  setUp(() {
    repository = MockUserRepository();
    bloc = AuthenticationBloc(repository);
  });

  test('initial state should be AuthenticationInitial', () {
    // assert
    expect(bloc.state, AuthenticationInitial());
  });

  blocTest<AuthenticationBloc, AuthenticationState>(
    'emits [AuthenticationAuthenticated] when [AppStarted] and the user has an active session.',
    build: () {
      when(() => repository.hasSessionActive()).thenAnswer((_) async => true);
      return bloc;
    },
    act: (bloc) => bloc.add(AppStarted()),
    expect: () => <AuthenticationState>[AuthenticationAuthenticated()],
  );

  blocTest<AuthenticationBloc, AuthenticationState>(
    'emits [AuthenticationUnauthenticated] when [AppStarted] and the user does not have an active session.',
    build: () {
      when(() => repository.hasSessionActive()).thenAnswer((_) async => false);
      return bloc;
    },
    act: (bloc) => bloc.add(AppStarted()),
    expect: () => <AuthenticationState>[AuthenticationUnauthenticated()],
  );

  blocTest<AuthenticationBloc, AuthenticationState>(
    'emits [AuthenticationLoading, AuthenticationAuthenticationFailed] when [LogInButtonPressed] and the username or password are empty',
    build: () => bloc,
    act: (bloc) => bloc.add(
      const LogInButtonPressed(
        '',
        '1212',
      ),
    ),
    expect: () => <AuthenticationState>[
      AuthenticationLoading(),
      const AuthenticationAuthenticationFailed(
          'Empty text fields. No valid data.')
    ],
  );

  blocTest<AuthenticationBloc, AuthenticationState>(
    'emits [AuthenticationLoading, AuthenticationAuthenticationFailed] when [LogInButtonPressed] and the username or password are not valid',
    build: () {
      when(() => repository.logIn(username: 'admin', password: 'admin'))
          .thenAnswer((_) async => false);
      return bloc;
    },
    act: (bloc) => bloc.add(
      const LogInButtonPressed(
        'admin',
        'admin',
      ),
    ),
    expect: () => <AuthenticationState>[
      AuthenticationLoading(),
      const AuthenticationAuthenticationFailed('Invalid password or username')
    ],
  );

  blocTest<AuthenticationBloc, AuthenticationState>(
    'emits [AuthenticationLoading, AuthenticationAuthenticated] when [LogInButtonPressed] and the username or password are valid',
    build: () {
      when(() => repository.logIn(
            username: 'maria',
            password: 'password',
          )).thenAnswer((_) async => true);
      return bloc;
    },
    act: (bloc) => bloc.add(
      const LogInButtonPressed(
        'maria',
        'password',
      ),
    ),
    expect: () => <AuthenticationState>[
      AuthenticationLoading(),
      AuthenticationAuthenticated()
    ],
  );
}
