import 'package:flutter/material.dart';
import 'package:intern_task/presentation/styles/colors.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
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
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 8,
            right: 16,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColor.primaryColor : AppColor.whiteColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              Container(
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  shadows: [
                    BoxShadow(
                      color: AppColor.shadowsColor.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(2, 2),
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: AppColor.whiteColor,
                  child: Icon(Icons.laptop),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                btnText,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
