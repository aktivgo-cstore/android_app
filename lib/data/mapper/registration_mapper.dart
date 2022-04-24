import '../../domain/model/user.dart';
import '../api/exception/registration_exception.dart';
import '../api/model/api_registration_user.dart';

class RegistrationMapper {
  static User fromApi(ApiRegistrationUser apiRegistrationUser) {
    if (apiRegistrationUser.error != null) {
      throw RegistrationException(apiRegistrationUser.error!);
    }
    return User(
      id: int.parse(apiRegistrationUser.id!),
      name: apiRegistrationUser.name!,
      token: apiRegistrationUser.token!,
    );
  }
}
