class LogoutBody {
  final String _token;

  LogoutBody({
    required token,
  }) : _token = token;

  Map<String, dynamic> toApi() {
    return {
      'token': _token,
    };
  }
}
