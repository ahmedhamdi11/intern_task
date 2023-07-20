import 'package:flutter/material.dart';
import 'package:intern_task/presentation/styles/colors.dart';
import 'package:intern_task/presentation/widget/default_text_field.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          // text field wraped with expanded to tak all space available
          Expanded(
            child: Container(
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
                    spreadRadius: 5,
                  )
                ],
              ),
              child: const DefaultTextField(
                hint: 'Search',
                suffix: Icon(Icons.search),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // filter button
          Container(
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
                  spreadRadius: 5,
                )
              ],
            ),
            child: const Icon(
              Icons.filter_alt_sharp,
              color: AppColor.greyColor,
            ),
          )
        ],
      ),
    );
  }
}
