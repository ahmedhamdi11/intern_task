import 'package:flutter/material.dart';
import 'package:intern_task/presentation/widget/select_product_image_item.dart';

class SelectProductImageListView extends StatelessWidget {
  const SelectProductImageListView({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return SelectProductImageItem(
            image: imageUrl,
          );
        },
      ),
    );
  }
}
