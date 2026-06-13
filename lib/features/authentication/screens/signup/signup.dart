import 'package:flutter/material.dart';
import 'package:rentease/features/authentication/screens/signup/widgets/SignupDivider.dart';
import 'package:rentease/features/authentication/screens/signup/widgets/SignupFooter.dart';
import 'package:rentease/features/authentication/screens/signup/widgets/SignupHeader.dart';
import 'package:rentease/features/authentication/screens/signup/widgets/signup_form.dart';
import '../../../../utils/constants/sizes.dart';
import '../login/widgets/social_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: const [
                SizedBox(height: 50),

                /// Header (RentEase + subtitle)
                SignupHeader(),

                SizedBox(height: 30),

                /// Form
                TSignupForm(),

                SizedBox(height: 25),

                /// Divider
                SignupDivider(),

                SizedBox(height: 20),

                /// Social Buttons
                TSocialButtons(),

                SizedBox(height: 25),

                /// Already have account
                SignupFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}