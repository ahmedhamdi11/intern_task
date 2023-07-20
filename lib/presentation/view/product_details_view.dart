import 'package:flutter/material.dart';
import 'package:intern_task/presentation/styles/colors.dart';

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

class ProductDetailsTab extends StatelessWidget {
  const ProductDetailsTab({
    super.key,
    required this.isSelected,
    this.onTap,
    required this.btnText,
  });
  final bool isSelected;
  final void Function()? onTap;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              btnText,
              style: TextStyle(
                color: isSelected
                    ? AppColor.greyColor
                    : AppColor.greyColor.withOpacity(0.5),
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            if (isSelected)
              const CircleAvatar(
                radius: 4,
                backgroundColor: AppColor.primaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
