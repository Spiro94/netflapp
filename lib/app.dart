import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/dependency_injection/dependency_injection.dart';
import 'core/routes/routes.dart';
import 'core/theme/theme_data.dart';
import 'presentation/screens/home/bloc/home_bloc.dart';
import 'presentation/screens/login/bloc/authentication_bloc.dart';
import 'presentation/screens/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) =>
              instance<AuthenticationBloc>()..add(AppStarted()),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => instance<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkThemeData,
        title: 'Netflapp',
        initialRoute: SplashPage.routeName,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
