import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../signup/signup.dart';
import '../../../../../utils/constants/colors.dart';
import 'login_divider.dart';
import 'social_buttons.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _EmailField(),
          SizedBox(height: 22),
          _PasswordField(),
          SizedBox(height: 42),
          _LoginButton(),
          SizedBox(height: 42),
          TLoginDivider(),
          SizedBox(height: 32),
          TSocialButtons(),
          SizedBox(height: 48),
          _SignupFooter(),
        ],
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "البريد الإلكتروني",
          style: TextStyle(
            color: TColors.PrimaryColor,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.emailAddress,
          decoration: _inputDecoration("name@example.com"),
        ),
      ],
    );
  }
}

class _PasswordField extends StatefulWidget {
  const _PasswordField();

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                "نسيت كلمة المرور؟",
                style: TextStyle(
                  color: Color(0xff8A8A8A),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Text(
              "كلمة المرور",
              style: TextStyle(
                color: TColors.PrimaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(
          obscureText: hidePassword,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          decoration: _inputDecoration(
            "••••••••",
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              icon: Icon(
                hidePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: const Color(0xffA7A7A7),
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

InputDecoration _inputDecoration(String hint, {Widget? suffixIcon}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(
      color: Color(0xffC7C7C7),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    filled: true,
    fillColor: const Color(0xffF5F5F5),
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 18,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide.none,
    ),
  );
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.PrimaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: const Text(
          "تسجيل الدخول",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _SignupFooter extends StatelessWidget {
  const _SignupFooter();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "ليس لديك حساب؟",
          style: TextStyle(
            color: Color(0xff777777),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 4),
        TextButton(
          onPressed: () => Get.to(() => const SignupScreen()),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            "إنشاء حساب جديد",
            style: TextStyle(
              color: TColors.PrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}