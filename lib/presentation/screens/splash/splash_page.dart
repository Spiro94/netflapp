import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/bloc/authentication_bloc.dart';
import '../login/intro_login.dart';
import '../navigation/navigation_page.dart';

class SplashPage extends StatelessWidget {
  static const routeName = 'splash';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationAuthenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, NavigationPage.routeName, (route) => false);
        }
        if (state is AuthenticationUnauthenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, IntroLoginPage.routeName, (route) => false);
        }
        if (state is AuthenticationAuthenticationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Invalid password or username')));
        }
      },
      child: const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Image(
            image: AssetImage('assets/images/netflapp.png'),
          ),
        ),
      ),
    );
  }
}
