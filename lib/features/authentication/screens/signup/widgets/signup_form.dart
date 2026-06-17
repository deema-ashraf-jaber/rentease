import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../verify_email.dart';
import 'terms_conditions_checkbox.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _SignupTextField(
            label: "الاسم الكامل",
            hint: "أدخل اسمك",
            icon: Iconsax.user,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 22),
          _SignupTextField(
            label: "البريد الإلكتروني",
            hint: "example@mail.com",
            icon: Iconsax.direct,
            keyboardType: TextInputType.emailAddress,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 22),
          _SignupTextField(
            label: "رقم الهاتف",
            hint: "+970 59 000 0000",
            icon: Iconsax.call,
            keyboardType: TextInputType.phone,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 22),
          _SignupPasswordField(),
          SizedBox(height: 26),
          TermsAndConditionsCheckbox(),
          SizedBox(height: 34),
          _CreateAccountButton(),
        ],
      ),
    );
  }
}

class _SignupTextField extends StatelessWidget {
  const _SignupTextField({
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.textDirection,
    this.textAlign,
  });

  final String label;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: TColors.PrimaryColor,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          keyboardType: keyboardType,
          textDirection: textDirection,
          textAlign: textAlign ?? TextAlign.right,
          decoration: _signupInputDecoration(
            hint: hint,
            prefixIcon: Icon(
              icon,
              color: const Color(0xff777777),
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}

class _SignupPasswordField extends StatefulWidget {
  const _SignupPasswordField();

  @override
  State<_SignupPasswordField> createState() => _SignupPasswordFieldState();
}

class _SignupPasswordFieldState extends State<_SignupPasswordField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "كلمة المرور",
          style: TextStyle(
            color: TColors.PrimaryColor,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          obscureText: hidePassword,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          decoration: _signupInputDecoration(
            hint: "••••••••",
            prefixIcon: const Icon(
              Iconsax.lock,
              color: Color(0xff777777),
              size: 24,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              icon: Icon(
                hidePassword ? Iconsax.eye_slash : Iconsax.eye,
                color: const Color(0xff777777),
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

InputDecoration _signupInputDecoration({
  required String hint,
  required Widget prefixIcon,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(
      color: Color(0xffC7C7C7),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    filled: true,
    fillColor: const Color(0xffF5F5F5),
    prefixIcon: prefixIcon,
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

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ElevatedButton.icon(
        onPressed: () => Get.to(() => const VerifyEmailScreen()),
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.PrimaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        icon: const Icon(Icons.arrow_back, size: 22),
        label: const Text(
          "إنشاء حساب",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}