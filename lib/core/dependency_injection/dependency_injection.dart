import 'package:get_it/get_it.dart';
import 'package:netflapp/data/repository/user_repository_impl.dart';
import 'package:netflapp/domain/respository/user_respository.dart';
import 'package:netflapp/presentation/screens/login/bloc/authentication_bloc.dart';

final instance = GetIt.instance;

Future<void> initDependencies() async {
  instance.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  instance.registerSingleton(AuthenticationBloc(instance()));
}
