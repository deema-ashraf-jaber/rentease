import 'package:flutter/material.dart';
import 'package:rentease/features/authentication/screens/login/confirm_code/confirm_code.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import 'widgets/back_to_login_section.dart';
import 'widgets/email_field_section.dart';
import 'widgets/forgot_password_header.dart';
import 'widgets/send_code_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.backgroundColor,
      appBar: const TAppBar(title: ''),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 38),

            const ForgotPasswordHeader(),

            const SizedBox(height: 48),

            const EmailFieldSection(),

            const SizedBox(height: 48),

            SendCodeButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const ConfirmCodeScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 48),

            const BackToLoginSection(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}