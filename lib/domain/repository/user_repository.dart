import '../model/user.dart';

abstract class UserRepository {
  Future<User> register({
    required String fullName,
    required String email,
    required String password,
  });

  Future<User> login({
    required String email,
    required String password,
  });

  Future<void> logout({required String token});
}
