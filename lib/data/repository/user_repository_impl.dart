import '../../domain/model/user.dart';
import '../../domain/repository/user_repository.dart';
import '../api/api_util.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiUtil apiUtil;

  UserRepositoryImpl(this.apiUtil);

  @override
  Future<User> login({required String email, required String password}) {
    return apiUtil.login(email: email, password: password);
  }

  @override
  Future<void> logout({required String token}) {
    return apiUtil.logout(token: token);
  }

  @override
  Future<User> register({
    required String fullName,
    required String email,
    required String password,
  }) {
    return apiUtil.register(
      fullName: fullName,
      email: email,
      password: password,
    );
  }
}
