import 'package:intern_task/data/models/account_model.dart';

class OtpResponse {
  final int status;
  final String message;
  final AccountModel? account;

  OtpResponse(
      {required this.status, required this.message, required this.account});

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      status: json['status'],
      message: json['message'],
      account: AccountModel.fromJson(json['account']),
    );
  }
}
