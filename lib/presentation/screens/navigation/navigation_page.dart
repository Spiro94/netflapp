import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../recents/recents_page.dart';

import '../../../core/dependency_injection/dependency_injection.dart';
import '../favorites/favorites_page.dart';
import '../home/home_page.dart';
import '../login/bloc/authentication_bloc.dart';
import '../login/intro_login.dart';

class NavigationPage extends StatefulWidget {
  static const String routeName = '/';
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _index = 0;
  Map<String, Widget> pages = {
    HomePage.title: const HomePage(),
    FavoritesPage.title: const FavoritesPage(),
    RecentsPage.title: const RecentsPage(),
    'Search': const Center(
      child: Text('No search yet!'),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      bloc: instance<AuthenticationBloc>(),
      listener: (context, state) {
        if (state is AuthenticationUnauthenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, IntroLoginPage.routeName, (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(pages.keys.elementAt(_index)),
          actions: [
            IconButton(
              onPressed: () {
                instance<AuthenticationBloc>().add(LogOutButtonPressed());
              },
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: pages.values.elementAt(_index),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: HomePage.title,
                icon: Icon(
                  Icons.home_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Favorites',
                icon: Icon(
                  Icons.favorite_border_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Recent',
                icon: Icon(Icons.replay_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Search ',
                icon: Icon(Icons.search_outlined),
              ),
            ]),
      ),
    );
  }
}

extension GetByKeyIndex on Map<String, Widget> {
  elementAt(int index) => values.elementAt(index);
}
