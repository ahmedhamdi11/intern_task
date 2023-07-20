import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/data/models/products_model.dart';
import 'package:intern_task/presentation/styles/colors.dart';

class ProductGridViewItem extends StatelessWidget {
  const ProductGridViewItem({
    super.key,
    required this.product,
  });
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/product', arguments: product);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 16.0,
        ),

        decoration: ShapeDecoration(
          color: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: const [
            BoxShadow(
              color: AppColor.shadowsColor,
              blurRadius: 8.0,
              offset: Offset(1, 2),
            )
          ],
        ),

        // product card body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            ProductCardImage(
              imageUrl: product.image,
            ),

            const SizedBox(
              height: 8.0,
            ),

            // details (name ,price)
            ProductCardDetails(
              product: product,
            ),

            // the add button
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16.0),
                    topLeft: Radius.circular(16.0),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColor.whiteColor,
                  size: 28.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCardImage extends StatelessWidget {
  const ProductCardImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 132.0,
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: AppColor.shadowsColor,
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 2,
          )
        ],
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ProductCardDetails extends StatelessWidget {
  const ProductCardDetails({
    super.key,
    required this.product,
  });
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.company,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            product.name,
            style: const TextStyle(
              color: AppColor.greyColor,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            '${product.price} EGP',
            style: const TextStyle(
              color: AppColor.greyColor,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
