class HelpModel {
  final int? id;
  final String question;
  final String answer;

  HelpModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory HelpModel.fromJson(Map<String, dynamic> json) {
    return HelpModel(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}
