import 'package:flutter/material.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../reset_password/reset_password.dart';
import 'widgets/confirm_code_header.dart';
import 'widgets/otp_fields.dart';
import 'widgets/resend_code_section.dart';
import 'widgets/verify_button.dart';
import 'widgets/support_section.dart';

class ConfirmCodeScreen extends StatefulWidget {
  const ConfirmCodeScreen({super.key});

  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  final List<TextEditingController> _controllers =
  List.generate(4, (_) => TextEditingController());

  final List<FocusNode> _focusNodes =
  List.generate(4, (_) => FocusNode());

  String get otpCode =>
      _controllers.map((controller) => controller.text).join();

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }

    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }
  }

  void _verifyCode() {
    if (otpCode.length == 4) {
      debugPrint('OTP Code: $otpCode');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('الرجاء إدخال رمز التحقق كامل'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            const SizedBox(height: 50),

            const ConfirmCodeHeader(),

            const SizedBox(height: 48),

            OtpFields(
              controllers: _controllers,
              focusNodes: _focusNodes,
              onChanged: _onOtpChanged,
            ),

            const SizedBox(height: 40),

            const ResendCodeSection(),

            const SizedBox(height: 48),

            VerifyButton(onPressed: _verifyCode),

            const Spacer(),

            const SupportSection(),

            const SizedBox(height: 96),
          ],
        ),
      ),
    );
  }
}