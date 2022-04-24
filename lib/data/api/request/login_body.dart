class LoginBody {
  final String _email;
  final String _password;

  LoginBody({
    required email,
    required password,
  })  : _email = email,
        _password = password;

  Map<String, dynamic> toApi() {
    return {
      'email': _email,
      'password': _password,
    };
  }
}
