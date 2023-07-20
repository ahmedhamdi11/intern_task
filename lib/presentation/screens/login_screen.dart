import 'package:flutter/material.dart';
import 'package:intern_task/presentation/styles/colors.dart';
import 'package:intern_task/presentation/view/login_form.dart';
import 'package:intern_task/presentation/widget/social_logins.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          // background image with filter
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              AppColor.primaryColor.withOpacity(0.4),
              BlendMode.srcOver,
            ),
            child: Image.asset(
              'assets/images/login_background.png',
              width: w,
              height: h,
              alignment: Alignment.topCenter,
            ),
          ),

          // the white container in the background
          Positioned(
            bottom: 0,
            child: Container(
              width: w,
              height: h * 0.7,
              decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
            ),
          ),

          //main view (login form and social logins)
          const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 140,
                ),

                // login with phone number
                LoginForm(),

                SizedBox(height: 112.0),

                // social logins (facebook,apple google)
                SocialLogins(),

                SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
