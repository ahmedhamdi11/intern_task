import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intern_task/data/models/products_model.dart';
import 'package:intern_task/presentation/styles/colors.dart';
import 'package:intern_task/presentation/widget/product_gridview_item.dart';

class HomeProductsGridView extends StatelessWidget {
  const HomeProductsGridView({
    super.key,
    required this.products,
  });
  final List<ProductsModel> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: MasonryGridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          // return the products title in the first index of the grid view
          if (index == 0) {
            return const IndexedStack(
              index: 0,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.0, bottom: 8.0),
                  child: Text(
                    'Recomended for You',
                    style: TextStyle(
                      color: AppColor.greyColor,
                      fontSize: 26,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            );

            //if its not the first index then return the product cart
          } else {
            return ProductGridViewItem(
              product: products[index],
            );
          }
        },
      ),
    );
  }
}
