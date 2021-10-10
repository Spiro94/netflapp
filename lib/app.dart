import 'package:flutter/material.dart';
import 'core/routes/routes.dart';
import 'core/theme/theme_data.dart';
import 'presentation/screens/navigation/navigation_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkThemeData,
      title: 'Netflapp',
      initialRoute: NavigationPage.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
