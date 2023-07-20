import 'package:flutter/material.dart';
import 'package:intern_task/presentation/styles/colors.dart';

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
