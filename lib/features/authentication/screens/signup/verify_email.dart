import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    super.key,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phone,
  });

  final String email;
  final String password;
  final String fullName;
  final String phone;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _formKey = GlobalKey<FormState>();

  final List<TextEditingController> codeControllers =
  List.generate(6, (_) => TextEditingController());

  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

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

  Future<void> verifyCode() async {
    if (!_formKey.currentState!.validate()) return;

    final code = codeControllers.map((e) => e.text).join();

    if (code.length != 6) {
      Get.snackbar(
        'تنبيه',
        'الرجاء إدخال رمز التحقق كامل',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      setState(() => isLoading = true);

      final supabase = Supabase.instance.client;

      await supabase.auth.verifyOTP(
        email: widget.email,
        token: code,
        type: OtpType.email,
      );

      await supabase.auth.updateUser(
        UserAttributes(
          password: widget.password,
          data: {
            'full_name': widget.fullName,
            'phone': widget.phone,
          },
        ),
      );

      Get.snackbar(
        'تم التحقق',
        'تم تأكيد الحساب بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAll(() => const LoginScreen());
    } on AuthException catch (e) {
      Get.snackbar(
        'خطأ',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
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

  Future<void> resendCode() async {
    try {
      await Supabase.instance.client.auth.signInWithOtp(
        email: widget.email,
        data: {
          'full_name': widget.fullName,
          'phone': widget.phone,
        },
      );

      Get.snackbar(
        'تم',
        'تم إرسال رمز التحقق مرة أخرى',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'تعذر إرسال الرمز مرة أخرى',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
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
                      6,
                          (index) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: index == 5 ? 0 : 8),
                          child: TextFormField(
                            controller: codeControllers[index],
                            focusNode: focusNodes[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
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
                              if (value == null || value.isEmpty) return '';
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
                    'أدخل رمز التحقق المكوّن من 6 أرقام المرسل إلى بريدك الإلكتروني.',
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