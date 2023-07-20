class LoginRequest {
  final String name;
  final String phoneNumber;

  LoginRequest({required this.name, required this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phoneNumber,
    };
  }
}
