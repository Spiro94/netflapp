abstract class UserRepository {
  Future<bool> logIn({required String username, required String password});
  Future<bool> logOut();
  Future<bool> hasSessionActive();
}
