class RegistrationBody {
  final String _fullName;
  final String _email;
  final String _password;

  RegistrationBody({
    required fullName,
    required email,
    required password,
  })  : _fullName = fullName,
        _email = email,
        _password = password;

  Map<String, String> toApi() {
    return {
      'fullName': _fullName,
      'email': _email,
      'password': _password,
    };
  }
}
