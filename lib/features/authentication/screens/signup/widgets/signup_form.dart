import 'package:flutter/material.dart';

class TSignupForm extends StatefulWidget {
  const TSignupForm({super.key});

  @override
  State<TSignupForm> createState() => _TSignupFormState();
}

class _TSignupFormState extends State<TSignupForm> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [

          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: 'الاسم الكامل',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'البريد الإلكتروني',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: 'رقم الهاتف',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextFormField(
            obscureText: hidePassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),

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
                ),
              ),

              labelText: 'كلمة المرور',
              border: const OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 24),

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