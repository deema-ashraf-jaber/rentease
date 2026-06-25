import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rentease/features/authentication/screens/login/success_screen/success_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import 'widgets/password_input_field.dart';
import 'widgets/password_rules_box.dart';
import 'widgets/password_support_row.dart';
import 'widgets/reset_password_header.dart';
import 'widgets/update_password_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isLoading = false;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _updatePassword() async {
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    final hasNumber = RegExp(r'[0-9]').hasMatch(password);
    final hasSpecialChar = RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password);

    if (password.isEmpty || confirmPassword.isEmpty) {
      _showMessage('الرجاء تعبئة كلمة المرور وتأكيدها');
      return;
    }

    if (password.length < 8) {
      _showMessage('كلمة المرور يجب أن تكون 8 أحرف على الأقل');
      return;
    }

    if (!hasNumber) {
      _showMessage('كلمة المرور يجب أن تحتوي على رقم واحد على الأقل');
      return;
    }

    if (!hasSpecialChar) {
      _showMessage('كلمة المرور يجب أن تحتوي على رمز خاص واحد على الأقل');
      return;
    }

    if (password != confirmPassword) {
      _showMessage('كلمة المرور وتأكيد كلمة المرور غير متطابقين');
      return;
    }

    try {
      setState(() => isLoading = true);

      // موقوف مؤقتًا:
      // هذا الكود يحتاج أن يكون المستخدم داخل جلسة Recovery بعد التحقق من كود Supabase.

      await Supabase.instance.client.auth.updateUser(
        UserAttributes(password: password),
      );


      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessScreen(),
        ),
      );
    } catch (e) {
      _showMessage('حدث خطأ أثناء تحديث كلمة المرور');
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.right,
        ),
        backgroundColor: TColors.PrimaryColor,
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
                onPressed: isLoading ? null : _updatePassword,
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