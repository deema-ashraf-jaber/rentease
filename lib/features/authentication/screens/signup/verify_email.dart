import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _formKey = GlobalKey<FormState>();

  final List<TextEditingController> codeControllers =
  List.generate(4, (_) => TextEditingController());

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  bool isLoading = false;

  @override
  void dispose() {
    for (final controller in codeControllers) {
      controller.dispose();
    }
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

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
          color: TColors.PrimaryColor,
          width: 1.5,
        ),
      ),
    );
  }

  void verifyCode() async {
    if (!_formKey.currentState!.validate()) return;

    final code = codeControllers.map((e) => e.text).join();

    if (code.length != 4) {
      Get.snackbar(
        'تنبيه',
        'الرجاء إدخال رمز التحقق كامل',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      setState(() => isLoading = true);

      // هون بعد ربط Supabase بنحط كود التحقق الحقيقي.
      /*
      await Supabase.instance.client.auth.verifyOTP(
        email: email,
        token: code,
        type: OtpType.signup,
      );
      */

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'رمز التحقق غير صحيح',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  void resendCode() {
    // هون بعد ربط Supabase بنحط كود إعادة إرسال الرمز.
    /*
    await Supabase.instance.client.auth.resend(
      type: OtpType.signup,
      email: email,
    );
    */

    Get.snackbar(
      'تم',
      'تم إرسال رمز التحقق مرة أخرى',
      snackPosition: SnackPosition.BOTTOM,
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
            child: Form(
              key: _formKey,
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
                      color: TColors.PrimaryColor,
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
                        color: TColors.PrimaryColor,
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
                          child:
                          TextFormField(
                            controller: codeControllers[index],
                            focusNode: focusNodes[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            maxLength: 1,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: codeDecoration(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              if (value.length == 1) {
                                if (index < focusNodes.length - 1) {
                                  FocusScope.of(context).requestFocus(
                                    focusNodes[index + 1],
                                  );
                                } else {
                                  FocusScope.of(context).unfocus();
                                }
                              }
                              if (value.isEmpty && index > 0) {
                                FocusScope.of(context).requestFocus(
                                  focusNodes[index - 1],
                                );
                              }
                            },
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
                      onPressed: isLoading ? null : verifyCode,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.PrimaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
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
                        isLoading ? 'جاري التحقق...' : 'تأكيد الحساب',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextButton(
                    onPressed: resendCode,
                    child: const Text(
                      'إعادة إرسال الرمز',
                      style: TextStyle(
                        color: TColors.PrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}