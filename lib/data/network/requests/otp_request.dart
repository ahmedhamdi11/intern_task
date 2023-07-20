class OtpRequest {
  final String code;
  final String phone;

  OtpRequest({required this.code, required this.phone});

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'phone': phone,
    };
  }
}
