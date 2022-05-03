import '../../domain/model/user.dart';
import '../api/exception/login_exception.dart';
import '../api/model/api_login_user.dart';

class LoginMapper {
  static User fromApi(ApiLoginUser apiLoginUser) {
    if (apiLoginUser.error != null) {
      throw LoginException(apiLoginUser.error!);
    }
    return User(
      id: int.parse(apiLoginUser.id!),
      name: apiLoginUser.name!,
      token: apiLoginUser.token!,
    );
  }
}
