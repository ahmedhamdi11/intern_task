class AccountModel {
  final int? id;
  final String? name;
  final String? phone;

  AccountModel({required this.id, required this.name, required this.phone});

  factory AccountModel.fromJson(Map<String, dynamic>? json) {
    return AccountModel(
      id: json?['id'],
      name: json?['name'],
      phone: json?['phone'],
    );
  }
}
