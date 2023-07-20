import 'package:flutter/material.dart';
import 'package:intern_task/data/models/help_model.dart';
import 'package:intern_task/presentation/styles/colors.dart';

class HelpListViewItem extends StatelessWidget {
  const HelpListViewItem({
    super.key,
    required this.helpModel,
  });
  final HelpModel helpModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: ShapeDecoration(
        color: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: AppColor.shadowsColor,
            blurRadius: 8,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: ExpansionTile(
        shape: const Border(),
        title: Text(
          helpModel.question,
          style: const TextStyle(
            color: AppColor.primaryColor,
            fontSize: 17,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        childrenPadding:
            const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        expandedAlignment: Alignment.centerLeft,
        children: [
          Text(
            helpModel.answer,
            style: const TextStyle(
              color: AppColor.greyColor,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
