import 'package:flutter/material.dart';

import '../../presentation/screens/login/intro_login.dart';
import '../../presentation/screens/navigation/navigation_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationPage.routeName:
        return MaterialPageRoute(builder: (_) => const NavigationPage());
      case IntroLoginPage.routeName:
        return MaterialPageRoute(builder: (_) => const IntroLoginPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}
