import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../verify_email.dart';
import 'terms_conditions_checkbox.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  InputDecoration customInput(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade200,
      prefixIcon: Icon(icon, color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "الاسم الكامل",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF1D3D7C),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: customInput("أدخل اسمك", Iconsax.user),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

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
            decoration: customInput("example@mail.com", Iconsax.direct),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "رقم الهاتف",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF1D3D7C),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: customInput("+970 59 000 0000", Iconsax.call),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "كلمة المرور",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF1D3D7C),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "••••••••",
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: const Icon(Iconsax.lock, color: Colors.grey),
              suffixIcon: const Icon(Iconsax.eye_slash, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          const TermsAndConditionsCheckbox(),

          const SizedBox(height: TSizes.spaceBtwSections),

          SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1D3D7C),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.arrow_back),
              label: const Text(
                "إنشاء حساب",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}