import 'package:flutter/material.dart';
import 'package:intern_task/presentation/styles/colors.dart';
import 'package:intern_task/presentation/view/home_view_body.dart';
import 'package:intern_task/presentation/widget/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(gradient: AppColor.backgroundGradient),
        child: const HomeViewBody(),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
