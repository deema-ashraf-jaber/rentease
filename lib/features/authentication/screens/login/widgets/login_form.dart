import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Email Label
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

          /// Email Field
          TextFormField(
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

          /// Password Label
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
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

          /// Password Field
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

          /// Login Button
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Get.to(() => NavigationMenu());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1D3D7C),
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

          /// Divider Text
          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey.shade300)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "أو المتابعة عبر",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Expanded(child: Divider(color: Colors.grey.shade300)),
            ],
          ),

          const SizedBox(height: 25),

          /// Social Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  child: const Text("جوجل Google"),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  child: const Text("جيميل Gmail"),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          /// Create account
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