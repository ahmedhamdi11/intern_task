import 'package:flutter/material.dart';
import 'package:intern_task/data/models/products_model.dart';
import 'package:intern_task/presentation/styles/colors.dart';
import 'package:intern_task/presentation/view/product_screen_body.dart';
import 'package:intern_task/presentation/widget/custom_back_buttom.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColor.backgroundGradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60.0,
            ),

            // go back button
            const CustomBackButton(),

            const SizedBox(
              height: 16.0,
            ),

            // product screen body
            Expanded(
              child: ProductScreenBody(
                product: product,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
