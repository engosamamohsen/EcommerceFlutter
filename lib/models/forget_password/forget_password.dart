class ForgetPasswordRequest {
  ForgetPasswordRequest({required this.email});

  final String email;

  Map<String, dynamic> toMap() {
    return {'email': email};
  }
}
