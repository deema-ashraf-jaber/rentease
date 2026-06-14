import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatefulWidget {
  const TLoginForm({super.key});

  @override
  State<TLoginForm> createState() => _TLoginFormState();
}

class _TLoginFormState extends State<TLoginForm> {
  bool hidePassword = true;

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

          TextFormField(
            obscureText: hidePassword,
            decoration: InputDecoration(
              hintText: "••••••••",
              filled: true,
              fillColor: Colors.grey.shade200,

              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                icon: Icon(
                  hidePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey,
                ),
              ),

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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1D3D7C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "تسجيل الدخول",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          Row(
            children: [
              Expanded(
                child: Divider(color: Colors.grey.shade300),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "أو المتابعة عبر",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Expanded(
                child: Divider(color: Colors.grey.shade300),
              ),
            ],
          ),

          const SizedBox(height: 25),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("جوجل Google"),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("جيميل Gmail"),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () =>
                    Get.to(() => const SignupScreen()),
                child: const Text(
                  "إنشاء حساب جديد",
                  style: TextStyle(
                    color: Color(0xFF1D3D7C),
                  ),
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