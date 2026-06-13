import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  InputDecoration codeDecoration() {
    return InputDecoration(
      counterText: '',
      filled: true,
      fillColor: Colors.grey.shade200,
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFF1D3D7C),
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                const Text(
                  'RentEase',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D3D7C),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'تأكيد البريد الإلكتروني',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 50),

                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'رمز التحقق',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1D3D7C),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: List.generate(
                    4,
                        (index) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: index == 3 ? 0 : 10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: codeDecoration(),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  'أدخل رمز التحقق المكوّن من 4 أرقام المرسل إلى بريدك الإلكتروني.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: TSizes.spaceBtwSections),

                SizedBox(
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.offAll(() => const LoginScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D3D7C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text(
                      'تأكيد الحساب',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'إعادة إرسال الرمز',
                    style: TextStyle(
                      color: Color(0xFF1D3D7C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}