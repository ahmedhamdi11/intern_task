import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/data/models/products_model.dart';
import 'package:intern_task/presentation/styles/colors.dart';
import 'package:intern_task/presentation/view/product_details_view.dart';
import 'package:intern_task/presentation/widget/product_addtocart_section.dart';
import 'package:intern_task/presentation/widget/select_product_image_listview.dart';
import 'package:intern_task/presentation/widget/view_store_button.dart';

class ProductScreenBody extends StatelessWidget {
  const ProductScreenBody({super.key, required this.product});
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //product name
            Text(
              product.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),

            //product type
            Text(
              product.type,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),

            // product image
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              padding: const EdgeInsets.all(16.0),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: const [
                  BoxShadow(
                    color: AppColor.shadowsColor,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: CachedNetworkImage(
                imageUrl: product.image,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),

            const SizedBox(
              height: 22.0,
            ),

            // select product image listview
            SelectProductImageListView(imageUrl: product.image),

            const SizedBox(
              height: 22.0,
            ),

            // view store button
            const ViewStoreButton(),

            const SizedBox(
              height: 28.0,
            ),

            // price and add to cart button
            ProductsAddToCartSection(product: product),

            const SizedBox(
              height: 28,
            ),

            const Divider(),

            // overview, spesification, review
            const ProducteDetailsTabs(),

            // (overview,spesification,review) body
            Text(
              product.description,
              style: TextStyle(
                color: AppColor.greyColor.withOpacity(0.8),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(
              height: 28,
            ),
          ],
        ),
      ),
    );
  }
}
