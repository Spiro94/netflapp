import 'package:flutter/material.dart';
import 'package:netflapp/presentation/screens/home/home_page.dart';
import 'package:netflapp/presentation/screens/login/intro_login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => const HomePage());
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
