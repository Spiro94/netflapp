import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/respository/user_respository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<bool> logIn(
      {required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if ((username == 'maria' && password == 'password') ||
        (username == 'pedro' && password == '123456')) {
      prefs.setBool('user', true);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> logOut() async {
    await Future.delayed(const Duration(seconds: 1));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('user', false);
    return true;
  }

  @override
  Future<bool> hasSessionActive() async {
    await Future.delayed(const Duration(seconds: 1));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('user') ?? false;
  }
}
