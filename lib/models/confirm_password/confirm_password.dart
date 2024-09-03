class ConfirmPasswordRequest {
  ConfirmPasswordRequest({required this.email, required this.code});
  String email;
  String code;

  Map<String, dynamic> toMap() {
    return {'email': email, "code": code};
  }
}
