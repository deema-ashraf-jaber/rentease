import 'package:flutter/material.dart';
import 'package:rentease/common/widgets/appbar/appbar.dart';
import 'package:rentease/features/shope/screens/technicalSupport/widgets/contact_tile.dart';
import 'package:rentease/features/shope/screens/technicalSupport/widgets/faq_tile.dart';
import 'package:rentease/features/shope/screens/technicalSupport/widgets/support_tile.dart';
import 'package:rentease/utils/constants/colors.dart';
import 'package:rentease/utils/constants/image_strings.dart';

class TechnicalSupportScreen extends StatelessWidget {
  const TechnicalSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: const TAppBar(
        title: 'الدعم الفني',
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.3, vertical: 8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.2),
                child: Image.asset(
                  TImages.support,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'كيف يمكننا مساعدتك اليوم؟ نحن هنا\nلخدمتك على مدار الساعة.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight:FontWeight.w700,color: Color(0xff434750),
                )
              ),

              const SizedBox(height: 24),

              const SupportTile(
                title: 'كيفية الاستخدام',
                subtitle: 'دليل شامل لاستخدام المنصة',
                icon: Icons.info_outline,
              ),
              const SizedBox(height: 14),

              const SupportTile(
                title: 'الحساب والأمان',
                subtitle: 'حماية حسابك وإعدادات الخصوصية',
                icon: Icons.security,
              ),
              const SizedBox(height: 14),

              const SupportTile(
                title: 'شروط الخدمة',
                subtitle: 'السياسات والاتفاقيات القانونية',
                icon: Icons.description_outlined,
              ),
              const SizedBox(height: 16.26),
               Divider(endIndent: 2 ,indent: 2,thickness:  1.02,color: Color(0xffE3E2E7).withOpacity(0.50),),
              const SizedBox(height: 16.26),
              const ContactTile(
                title: 'محادثة مباشرة',
                icon: Icons.chat_outlined,
                isSelected: true,
              ),
              const SizedBox(height: 16.26),

              const ContactTile(
                title: 'اتصل بنا',
                icon: Icons.phone_outlined,
              ),
              const SizedBox(height: 16.26),

              const ContactTile(
                title: 'الدعم عبر البريد الإلكتروني',
                icon: Icons.mail_outline,
              ),

              const SizedBox(height: 32),

                   Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'الأسئلة الأكثر شيوعاً',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: TColors.PrimaryColor
                      )
                    ),
                  ),


              const SizedBox(height: 16.26),

              const FaqTile(title: 'كيف يمكنني إلغاء الحجز؟'),
              const SizedBox(height: 8),
              const FaqTile(title: 'هل الدفع عبر التطبيق آمن؟'),
            ],
          ),
        ),
      ),
    );
  }
}



