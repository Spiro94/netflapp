import 'package:flutter/material.dart';
import 'package:netflapp/core/routes/routes.dart';
import 'package:netflapp/core/theme/theme_data.dart';
import 'package:netflapp/presentation/screens/login/intro_login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkThemeData,
      title: 'Netflapp',
      initialRoute: IntroLoginPage.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
