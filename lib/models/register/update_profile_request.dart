class UpdateProfileRequest {
  UpdateProfileRequest(
      {required this.name, required this.email, required this.phone});

  final String name;
  final String email;
  final String phone;
  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'phone': phone};
  }
}
