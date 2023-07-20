import 'package:intern_task/data/models/products_model.dart';

class GetProductsResponse {
  final int status;
  final String message;
  final List<ProductsModel>? products;

  GetProductsResponse({
    required this.status,
    required this.message,
    required this.products,
  });

  factory GetProductsResponse.fromJson(Map<String, dynamic> json) {
    List<ProductsModel> products = [];

    if (json['products'] != null) {
      json['products'].forEach((e) {
        products.add(ProductsModel.fromJson(e));
      });
    }

    return GetProductsResponse(
      status: json['status'],
      message: json['message'],
      products: products,
    );
  }
}
