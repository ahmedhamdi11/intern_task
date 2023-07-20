import 'package:flutter/material.dart';
import 'package:intern_task/data/models/products_model.dart';
import 'package:intern_task/presentation/styles/colors.dart';
import 'package:intern_task/presentation/widget/default_button.dart';

class ProductsAddToCartSection extends StatelessWidget {
  const ProductsAddToCartSection({
    super.key,
    required this.product,
  });
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Price',
              style: TextStyle(
                color: AppColor.greyColor.withOpacity(0.5),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '${product.price} EGP',
              style: const TextStyle(
                color: AppColor.greyColor,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        const SizedBox(
          width: 28,
        ),
        const Expanded(
          child: DefaultButton(
            btnText: 'Add To Cart',
            radius: 12.0,
          ),
        )
      ],
    );
  }
}
