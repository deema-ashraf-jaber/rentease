import 'package:flutter/material.dart';

import '../../../../../bottom_navigation.dart';
import '../../../../../utils/constants/colors.dart';
import '../forgot_password/forgot_password.dart';

class TLoginForm extends StatefulWidget {
  const TLoginForm({super.key});

  @override
  State<TLoginForm> createState() => _TLoginFormState();
}

class _TLoginFormState extends State<TLoginForm> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      // هون لاحقاً بنحط كود Supabase
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigationScreen(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ: $e')),
      );
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "البريد الإلكتروني",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: TColors.PrimaryColor,
              ),
            ),
          ),
          const SizedBox(height: 8),

          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'البريد الإلكتروني مطلوب';
              }

              final emailRegex = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );

              if (!emailRegex.hasMatch(value.trim())) {
                return 'أدخلي بريد إلكتروني صحيح';
              }

              return null;
            },
            decoration: InputDecoration(
              hintText: "name@example.com",
              filled: true,
              fillColor: const Color(0xffE8E8E8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: const Color(0xff777777).withOpacity(0.50),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "كلمة المرور",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: TColors.PrimaryColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  );
                },
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.zero),
                  minimumSize: WidgetStatePropertyAll(Size.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  "نسيت كلمة المرور؟",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff222222).withOpacity(0.70),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          TextFormField(
            controller: passwordController,
            obscureText: hidePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'كلمة المرور مطلوبة';
              }

              if (value.length < 8) {
                return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
              }

              return null;
            },
            decoration: InputDecoration(
              hintText: "••••••••",
              filled: true,
              fillColor: const Color(0xffE8E8E8),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() => hidePassword = !hidePassword);
                },
                icon: Icon(
                  hidePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: const Color(0xff777777).withOpacity(0.50),
              ),
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: isLoading ? null : login,
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.PrimaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: isLoading
                  ? const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              )
                  : Text(
                "تسجيل الدخول",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}