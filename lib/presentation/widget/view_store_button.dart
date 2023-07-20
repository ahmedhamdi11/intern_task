import 'package:flutter/material.dart';
import 'package:intern_task/presentation/styles/colors.dart';

class ViewStoreButton extends StatelessWidget {
  const ViewStoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      padding: const EdgeInsets.all(4.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: AppColor.shadowsColor,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          // store logo
          Container(
            width: 55,
            height: 55,
            decoration: ShapeDecoration(
              color: AppColor.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                  color: AppColor.shadowsColor,
                  blurRadius: 4,
                  offset: Offset(0, 0),
                )
              ],
            ),
            child: Image.asset('assets/images/acer_logo.png'),
          ),

          const SizedBox(
            width: 12.0,
          ),

          // store name and (view store text)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Acer Official Store',
                style: TextStyle(
                  color: AppColor.greyColor,
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'View Store',
                style: TextStyle(
                  color: AppColor.greyColor.withOpacity(0.5),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),

          const Spacer(),

          // arrow right icon
          Container(
            width: 30,
            height: 30,
            decoration: ShapeDecoration(
              color: AppColor.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              shadows: const [
                BoxShadow(
                  color: AppColor.shadowsColor,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: const Icon(
              Icons.keyboard_arrow_right,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(
            width: 8.0,
          )
        ],
      ),
    );
  }
}
