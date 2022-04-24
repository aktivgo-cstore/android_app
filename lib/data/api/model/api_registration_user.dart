class ApiRegistrationUser {
  String? id;
  String? token;
  String? name;
  String? error;

  ApiRegistrationUser.fromApi(Map<String, dynamic> map) {
    if (map.containsKey('error')) {
      error = map['error'];
    } else {
      name = map['fullName'];
      id = map['id'];
      token = map['token'];
    }
  }
}
