import 'package:flutter/material.dart';
import 'package:intern_task/data/models/products_model.dart';
import 'package:intern_task/presentation/screens/help_screen.dart';
import 'package:intern_task/presentation/screens/home_screen.dart';
import 'package:intern_task/presentation/screens/login_screen.dart';
import 'package:intern_task/presentation/screens/otp_screen.dart';
import 'package:intern_task/presentation/screens/product_screeen.dart';
import 'package:intern_task/presentation/screens/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/otp':
        return MaterialPageRoute(
          builder: (_) => OtpScreen(
            phoneNumber: settings.arguments as String,
          ),
        );
      case '/help':
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/product':
        return MaterialPageRoute(
          builder: (_) => ProductScreen(
            product: settings.arguments as ProductsModel,
          ),
        );
      default:
        return null;
    }
  }
}
