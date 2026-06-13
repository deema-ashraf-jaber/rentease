import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../login/login.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => Get.to(() => const LoginScreen()),
          child: const Text(
            "تسجيل الدخول",
            style: TextStyle(color: Color(0xFF1D3D7C)),
          ),
        ),
        const Text("لديك حساب بالفعل؟"),
      ],
    );
  }
}