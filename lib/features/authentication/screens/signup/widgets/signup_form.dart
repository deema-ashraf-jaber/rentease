import 'package:flutter/material.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// Full Name
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: 'الاسم الكامل',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          /// Email
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'البريد الإلكتروني',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          /// Phone Number
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: 'رقم الهاتف',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          /// Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.remove_red_eye),
              labelText: 'كلمة المرور',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 24),

          /// Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('إنشاء حساب'),
            ),
          ),
        ],
      ),
    );
  }
}