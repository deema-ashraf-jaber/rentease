import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentease/features/authentication/screens/login/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../verify_email.dart';

class TSignupForm extends StatefulWidget {
  const TSignupForm({super.key});

  @override
  State<TSignupForm> createState() => _TSignupFormState();
}

class _TSignupFormState extends State<TSignupForm> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool acceptTerms = false;
  bool hidePassword = true;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  InputDecoration customInput(String hint, IconData icon, {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade200,
      prefixIcon: Icon(icon, color: Colors.grey),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      errorMaxLines: 2,
    );
  }

  Future<void> signup() async {
    if (!_formKey.currentState!.validate()) return;

    if (!acceptTerms) {
      Get.snackbar(
        'تنبيه',
        'يجب الموافقة على الشروط والأحكام',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      setState(() => isLoading = true);

      // await Supabase.instance.client.auth.signInWithOtp(
      //   email: emailController.text.trim(),
      //   data: {
      //     'full_name': fullNameController.text.trim(),
      //     'phone': phoneController.text.trim(),
      //     'password': passwordController.text.trim(),
      //   },
      // );
      await Supabase.instance.client.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        data: {
          'full_name': fullNameController.text.trim(),
          'phone': phoneController.text.trim(),
        },
      );
      Get.snackbar(
        'تم إرسال الرمز',
        'تم إرسال رمز التحقق إلى بريدك الإلكتروني',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Get.to(
      //       () => VerifyEmailScreen(
      //     email: emailController.text.trim(),
      //     password: passwordController.text.trim(),
      //     fullName: fullNameController.text.trim(),
      //     phone: phoneController.text.trim(),
      //   ),
      // );

      Get.offAll(()  => const LoginScreen());
    } on AuthException catch (e) {
      Get.snackbar(
        'خطأ',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء إنشاء الحساب',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  Widget fieldTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: TColors.PrimaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          fieldTitle("الاسم الكامل"),
          const SizedBox(height: 8),
          TextFormField(
            controller: fullNameController,
            decoration: customInput("أدخل اسمك", Iconsax.user),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'الرجاء إدخال الاسم الكامل';
              }
              if (value.trim().length < 3) {
                return 'الاسم يجب أن يكون 3 أحرف على الأقل';
              }
              return null;
            },
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          fieldTitle("البريد الإلكتروني"),
          const SizedBox(height: 8),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: customInput("example@mail.com", Iconsax.direct),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'الرجاء إدخال البريد الإلكتروني';
              }
              if (!GetUtils.isEmail(value.trim())) {
                return 'الرجاء إدخال بريد إلكتروني صحيح';
              }
              return null;
            },
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          fieldTitle("رقم الهاتف"),
          const SizedBox(height: 8),
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: customInput("+970 59 000 0000", Iconsax.call),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'الرجاء إدخال رقم الهاتف';
              }
              if (value.trim().length < 9) {
                return 'رقم الهاتف غير صحيح';
              }
              return null;
            },
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          fieldTitle("كلمة المرور"),
          const SizedBox(height: 8),
          TextFormField(
            controller: passwordController,
            obscureText: hidePassword,
            decoration: customInput(
              "••••••••",
              Iconsax.lock,
              suffixIcon: IconButton(
                icon: Icon(
                  hidePassword ? Iconsax.eye_slash : Iconsax.eye,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() => hidePassword = !hidePassword);
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال كلمة المرور';
              }
              if (value.length < 8) {
                return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
              }
              return null;
            },
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          Row(
            children: [
              Checkbox(
                value: acceptTerms,
                activeColor: TColors.PrimaryColor,
                onChanged: (value) {
                  setState(() => acceptTerms = value ?? false);
                },
              ),
              const Expanded(
                child: Text(
                  'أوافق على شروط وأحكام RentEase',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              onPressed: isLoading ? null : signup,
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.PrimaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: isLoading
                  ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
                  : const Icon(Icons.arrow_back),
              label: Text(
                isLoading ? "جاري إرسال الرمز..." : "إنشاء حساب",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}