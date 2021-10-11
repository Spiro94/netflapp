import 'package:flutter_test/flutter_test.dart';
import 'package:netflapp/data/repository/user_repository_impl.dart';

void main() {
  UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl();

  test('should Log in with valid credentials', () async {
    //arrange

    //act
    bool result =
        await userRepositoryImpl.logIn(username: 'maria', password: 'password');

    //assert
    expect(result, true);
  });

  test('should return true if the session is active after login', () async {
    //arrange

    //act
    bool result = await userRepositoryImpl.hasSessionActive();

    //assert
    expect(result, true);
  });

  test('should log out successfuly', () async {
    //arrange

    //act
    bool result = await userRepositoryImpl.logOut();

    //assert
    expect(result, true);
  });

  test('should not Log in with invalid credentials', () async {
    //arrange

    //act
    bool result =
        await userRepositoryImpl.logIn(username: '1', password: 'dsfasd');

    //assert
    expect(result, false);
  });
}
