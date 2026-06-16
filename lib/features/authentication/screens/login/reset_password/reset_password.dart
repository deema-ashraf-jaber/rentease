import 'package:flutter/material.dart';
import 'package:rentease/features/authentication/screens/login/success_screen/success_screen.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import 'widgets/password_input_field.dart';
import 'widgets/password_rules_box.dart';
import 'widgets/password_support_row.dart';
import 'widgets/reset_password_header.dart';
import 'widgets/update_password_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _goToSuccessScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SuccessScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.backgroundColor,
      appBar: const TAppBar(title: ''),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),

              const ResetPasswordHeader(),

              const SizedBox(height: 32),

              PasswordInputField(
                label: 'كلمة المرور الجديدة',
                hintText: 'أدخل كلمة المرور',
                controller: passwordController,
                obscureText: obscurePassword,
                onVisibilityPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),

              const SizedBox(height: 24),

              PasswordInputField(
                label: 'تأكيد كلمة المرور',
                hintText: 'أعد كتابة كلمة المرور',
                controller: confirmPasswordController,
                obscureText: obscureConfirmPassword,
                onVisibilityPressed: () {
                  setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  });
                },
              ),

              const SizedBox(height: 24),

              const PasswordRulesBox(),

              const SizedBox(height: 134),

              UpdatePasswordButton(
                onPressed: _goToSuccessScreen,
              ),

              const SizedBox(height: 23),

              const PasswordSupportRow(),
            ],
          ),
        ),
      ),
    );
  }
}