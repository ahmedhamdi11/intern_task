import 'package:flutter/material.dart';
import 'package:intern_task/presentation/styles/colors.dart';

class SocialLogins extends StatelessWidget {
  const SocialLogins({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
                child: Divider(
              color: AppColor.primaryColor,
              indent: 28.0,
              endIndent: 8.0,
            )),
            Text('OR'),
            Expanded(
              child: Divider(
                color: AppColor.primaryColor,
                indent: 8.0,
                endIndent: 28.0,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 68.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/facebook.png',
              width: 80,
            ),
            Image.asset(
              'assets/images/apple.png',
              width: 80,
            ),
            Image.asset(
              'assets/images/google.png',
              width: 80,
            ),
          ],
        ),
      ],
    );
  }
}
