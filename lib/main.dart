import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentease/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:rentease/features/use/account_security_screen.dart';
import 'package:rentease/features/use/how_to_use_screen.dart';
import 'package:rentease/features/use/payment_fees_screen.dart';
import 'package:rentease/features/use/terms_of_service_screen.dart';

import 'features/authentication/screens/login/login.dart';
import 'features/authentication/screens/onboarding/onboarding.dart';
import 'features/authentication/screens/signup/signup.dart';
import 'features/favorites/screens/favorites_screen.dart';
import 'features/search/search.dart';
import 'features/support/technical_support_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PaymentFeesScreen(),
      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
      ],
    );
  }
}