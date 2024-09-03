class LoginRequest {
  LoginRequest({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toMap() {
    return {'key': email, 'password': password, 'type': 1};
  }
}
