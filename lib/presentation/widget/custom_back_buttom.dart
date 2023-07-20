import 'package:flutter/material.dart';
import 'package:intern_task/presentation/styles/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
              BoxShadow(
                color: AppColor.shadowsColor,
                blurRadius: 5,
                offset: Offset(2, 2),
              )
            ],
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.greyColor,
          ),
        ),
      ),
    );
  }
}
