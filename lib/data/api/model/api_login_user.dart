class ApiLoginUser {
  String? token;
  String? name;
  String? id;
  String? email;
  String? isActivated;
  String? role;
  String? error;

  ApiLoginUser.fromApi(Map<String, dynamic> map) {
    if (map.containsKey('error')) {
      error = map['error'];
    } else {
      name = map['fullName'];
      token = map['token'];
      id = map['id'];
      email = map['email'];
      isActivated = map['is_activated'];
      role = map['role'];
    }
  }
}
