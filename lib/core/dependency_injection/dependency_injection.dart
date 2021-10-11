import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../data/repository/tv_show_repositorty_impl.dart';
import '../../data/repository/user_repository_impl.dart';
import '../../domain/respository/tv_show_respository.dart';
import '../../domain/respository/user_respository.dart';
import '../../presentation/screens/home/bloc/home_bloc.dart';
import '../../presentation/screens/login/bloc/authentication_bloc.dart';

final instance = GetIt.instance;

Future<void> initDependencies() async {
  instance.registerLazySingleton(() => http.Client());
  instance.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  instance.registerLazySingleton<TvShowRepository>(
      () => TvShowRepositoryImpl(instance()));
  instance.registerSingleton(HomeBloc(instance()));
  instance.registerSingleton(AuthenticationBloc(instance()));
}
