import 'package:intern_task/data/models/help_model.dart';

class HelpResponse {
  final int status;
  final String message;
  final List<HelpModel>? help;

  HelpResponse({
    required this.status,
    required this.message,
    required this.help,
  });

  factory HelpResponse.fromJson(Map<String, dynamic> json) {
    List<HelpModel> help = [];

    if (json['help'] != null) {
      json['help'].forEach((e) {
        help.add(HelpModel.fromJson(e));
      });
    }

    return HelpResponse(
      status: json['status'],
      message: json['message'],
      help: help,
    );
  }
}
