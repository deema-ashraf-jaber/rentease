import 'package:flutter/material.dart';
import 'package:rentease/features/authentication/screens/login/confirm_code/confirm_code.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import 'widgets/back_to_login_section.dart';
import 'widgets/email_field_section.dart';
import 'widgets/forgot_password_header.dart';
import 'widgets/send_code_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void sendCode() {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'الرجاء إدخال البريد الإلكتروني',
            textAlign: TextAlign.right,
          ),
          backgroundColor: TColors.PrimaryColor,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmCodeScreen(email: email),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.backgroundColor,
      appBar: const TAppBar(title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 38),
              const ForgotPasswordHeader(),
              const SizedBox(height: 48),

              EmailFieldSection(controller: emailController),

              const SizedBox(height: 48),

              SendCodeButton(onPressed: sendCode),

              const SizedBox(height: 48),
              const BackToLoginSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}