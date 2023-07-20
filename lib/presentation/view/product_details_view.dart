import 'package:flutter/material.dart';
import 'package:intern_task/presentation/widget/product_details_tab.dart';

class ProducteDetailsTabs extends StatefulWidget {
  const ProducteDetailsTabs({
    super.key,
  });

  @override
  State<ProducteDetailsTabs> createState() => _ProducteDetailsTabsState();
}

class _ProducteDetailsTabsState extends State<ProducteDetailsTabs> {
  late int selectedTap;

  List<String> tabs = [
    'overview',
    'spesification',
    'review',
  ];

  @override
  void initState() {
    super.initState();
    selectedTap = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          return ProductDetailsTab(
            btnText: tabs[index],
            isSelected: selectedTap == index,
            onTap: () {
              setState(() {
                selectedTap = index;
              });
            },
          );
        },
      ),
    );
  }
}
