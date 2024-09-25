class ContactRequest {
  ContactRequest(
      {required this.name,
      required this.phone,
      required this.email,
      required this.message});

  final String name;

  final String phone;
  final String email;
  final String message;

  Map<String, dynamic> toMap() {
    return {'name': name, 'phone': phone, 'email': email, 'message': message};
  }
}
