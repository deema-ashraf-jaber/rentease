import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rentease/utils/constants/colors.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../reset_password/reset_password.dart';
import 'widgets/confirm_code_header.dart';
import 'widgets/otp_fields.dart';
import 'widgets/resend_code_section.dart';
import 'widgets/verify_button.dart';
import 'widgets/support_section.dart';

class ConfirmCodeScreen extends StatefulWidget {
  const ConfirmCodeScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  final List<TextEditingController> _controllers =
  List.generate(4, (_) => TextEditingController());

  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  bool isLoading = false;

  String get otpCode => _controllers.map((controller) => controller.text).join();

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

  Future<void> _verifyCode() async {
    if (otpCode.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('الرجاء إدخال رمز التحقق كامل'),
        ),
      );
      return;
    }

    try {
      setState(() => isLoading = true);

      // موقوف مؤقتًا عشان ما نستهلك Rate Limit تبع Supabase Email/OTP.
      /*
      await Supabase.instance.client.auth.verifyOTP(
        email: widget.email,
        token: otpCode,
        type: OtpType.recovery,
      );
      */

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(email: widget.email),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('رمز التحقق غير صحيح'),
        ),
      );
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.backgroundColor,
      appBar: const TAppBar(title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 50),
              ConfirmCodeHeader(email: widget.email),
              const SizedBox(height: 48),
              OtpFields(
                controllers: _controllers,
                focusNodes: _focusNodes,
                onChanged: _onOtpChanged,
              ),
              const SizedBox(height: 40),
              const ResendCodeSection(),
              const SizedBox(height: 48),
              VerifyButton(onPressed: isLoading ? null : _verifyCode),
              const SizedBox(height: 176),
              const SupportSection(),
              const SizedBox(height: 96),
            ],
          ),
        ),
      ),
    );
  }
}