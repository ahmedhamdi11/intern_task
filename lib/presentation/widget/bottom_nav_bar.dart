import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/data/data_providers/local/cache_helper.dart';
import 'package:intern_task/presentation/styles/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: AppColor.primaryColor,
      animationDuration: const Duration(milliseconds: 300),
      onTap: (index) {
        currentIndex = index;
        setState(() {});
        if (index == 0) {
          CacheHelper.clearData();
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/login', (route) => false);
        }
      },
      index: currentIndex,
      items: [
        Icon(
          Icons.logout_outlined,
          color: currentIndex == 0 ? AppColor.whiteColor : AppColor.greyColor,
        ),
        Icon(
          Icons.favorite,
          color: currentIndex == 1 ? AppColor.whiteColor : AppColor.greyColor,
        ),
        Icon(
          Icons.home,
          color: currentIndex == 2 ? AppColor.whiteColor : AppColor.greyColor,
        ),
        Icon(
          Icons.notifications,
          color: currentIndex == 3 ? AppColor.whiteColor : AppColor.greyColor,
        ),
        Icon(
          Icons.settings,
          color: currentIndex == 4 ? AppColor.whiteColor : AppColor.greyColor,
        ),
      ],
    );
  }
}
