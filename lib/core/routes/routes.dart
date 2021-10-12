import 'package:flutter/material.dart';
import 'package:netflapp/data/models/tv_show_model.dart';
import 'package:netflapp/presentation/screens/details/details_page.dart';
import 'package:netflapp/presentation/screens/episodes/episodes_page.dart';
import 'package:netflapp/presentation/screens/splash/splash_page.dart';

import '../../presentation/screens/login/intro_login.dart';
import '../../presentation/screens/navigation/navigation_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case EpisodesPage.routeName:
        return MaterialPageRoute(
            builder: (_) =>
                EpisodesPage(model: settings.arguments as TvShowModel));
      case DetailsPage.routeName:
        return MaterialPageRoute(
            builder: (_) =>
                DetailsPage(model: settings.arguments as TvShowModel));
      case SplashPage.routeName:
        return MaterialPageRoute(builder: (_) => const SplashPage());
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
