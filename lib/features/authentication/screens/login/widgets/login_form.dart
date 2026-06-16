import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../bottom_navigation.dart';
import '../../signup/signup.dart';
import '../forgot_password/forgot_password.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "البريد الإلكتروني",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF1D3D7C),
              ),
            ),
          ),
          const SizedBox(height: 8),

          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "name@example.com",
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const ForgotPasswordScreen(),
                    ),
                  );
                },
                child: const Text(
                  "نسيت كلمة المرور؟",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const Text(
                "كلمة المرور",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1D3D7C),
                ),
              ),
            ],
          ),

          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "••••••••",
              filled: true,
              fillColor: Colors.grey.shade200,
              suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 50,
            child: ElevatedButton(
               onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) =>
          const BottomNavigationScreen(),
          ),
          );
          },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1D3D7C),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "تسجيل الدخول",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(
                  "إنشاء حساب جديد",
                  style: TextStyle(color: Color(0xFF1D3D7C)),
                ),
              ),
              const Text("ليس لديك حساب؟"),
            ],
          ),
        ],
      ),
    );
  }
}