import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import 'widgets/login_header.dart';
import 'widgets/login_form.dart';
import 'widgets/login_divider.dart';
import 'widgets/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.defaultSpace,
              vertical: TSizes.defaultSpace * 2,
            ),
            child: Column(
              children: const [
                SizedBox(height: 30),
                TLoginHeader(),
                SizedBox(height: 30),
                TLoginForm(),
                SizedBox(height: 25),
                TLoginDivider(),
                SizedBox(height: 25),
                TSocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}