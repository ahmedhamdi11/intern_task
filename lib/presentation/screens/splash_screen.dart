import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_task/data/data_providers/local/cache_helper.dart';
import 'package:intern_task/presentation/styles/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Future.delayed(const Duration(seconds: 2)).then((value) {
      var id = CacheHelper.getDataFromSharedPreference(key: 'id');
      Navigator.of(context).pushNamedAndRemoveUntil(
        id == null ? '/login' : '/home',
        (route) => false,
      );
    });

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        color: AppColor.primaryColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/splash_background.svg',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: w * 0.9,
            )
          ],
        ),
      ),
    );
  }
}
