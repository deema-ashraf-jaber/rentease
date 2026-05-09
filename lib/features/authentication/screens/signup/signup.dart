import 'package:flutter/material.dart';
import 'package:rentease/features/authentication/screens/signup/widgets/SignupDivider.dart';
import 'package:rentease/features/authentication/screens/signup/widgets/SignupFooter.dart';
import 'package:rentease/features/authentication/screens/signup/widgets/SignupHeader.dart';

import '../../../../utils/constants/sizes.dart';
import '../login/widgets/social_buttons.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                SizedBox(height: 50),
                SignupHeader(),
                SizedBox(height: 30),
                TSignupForm(),
                SizedBox(height: 25),
                SignupDivider(),
                SizedBox(height: 20),
                TSocialButtons(),
                SizedBox(height: 25),
                SignupFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}