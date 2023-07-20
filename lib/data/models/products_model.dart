class ProductsModel {
  final int id;
  final String company;
  final String name;
  final String type;
  final String price;
  final String image;
  final String description;

  ProductsModel({
    required this.id,
    required this.company,
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    required this.description,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      company: json['company'],
      name: json['name'],
      type: json['type'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
    );
  }
}
