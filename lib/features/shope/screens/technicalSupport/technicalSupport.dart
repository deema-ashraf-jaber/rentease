import 'package:flutter/material.dart';
import 'package:rentease/common/widgets/appbar/appbar.dart';
import 'package:rentease/features/shope/screens/technicalSupport/widgets/contact_tile.dart';
import 'package:rentease/features/shope/screens/technicalSupport/widgets/faq_tile.dart';
import 'package:rentease/features/shope/screens/technicalSupport/widgets/support_tile.dart';
import 'package:rentease/utils/constants/colors.dart';
import 'package:rentease/utils/constants/image_strings.dart';
import 'package:url_launcher/url_launcher.dart';
import '../chats/models/chat_model.dart';
import '../chats/one_chats/one_chats.dart';
import '../support/technical_support_screen.dart';
import '../use/account_security_screen.dart';
import '../use/how_to_use_screen.dart';
import '../use/terms_of_service_screen.dart';

class TechnicalSupportScreen extends StatelessWidget {
  const TechnicalSupportScreen({super.key});

  Future<void> _callSupport() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '0599999999');

    if (!await launchUrl(phoneUri)) {
      throw Exception('Could not launch phone');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: const TAppBar(title: 'الدعم الفني'),
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
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff434750),
                ),
              ),

              const SizedBox(height: 24),

              SupportTile(
                title: 'كيفية الاستخدام',
                subtitle: 'دليل شامل لاستخدام المنصة',
                icon: Icons.info_outline,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HowToUseScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 14),

              SupportTile(
                title: 'الحساب والأمان',
                subtitle: 'حماية حسابك وإعدادات الخصوصية',
                icon: Icons.security,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AccountSecurityScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 14),

              SupportTile(
                title: 'شروط الخدمة',
                subtitle: 'السياسات والاتفاقيات القانونية',
                icon: Icons.description_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TermsOfServiceScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16.26),

              Divider(
                endIndent: 2,
                indent: 2,
                thickness: 1.02,
                color: const Color(0xffE3E2E7).withOpacity(0.50),
              ),

              const SizedBox(height: 16.26),

              ContactTile(
                title: 'محادثة مباشرة',
                icon: Icons.chat_outlined,
                isSelected: true,
                onPressed: () {
                  const supportChat = ChatModel(
                    name: 'الدعم الفني',
                    lastMessage: 'مرحباً، كيف يمكننا مساعدتك اليوم؟',
                    time: 'الآن',
                    isOnline: true,
                    isCompany: true,
                    messages: [
                      ChatMessageModel(
                        text:
                        'مرحباً بك في دعم RentEase، كيف يمكننا مساعدتك اليوم؟',
                        isSender: true,
                        time: 'الآن',
                      ),
                    ],
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OneChatsScreen(chat: supportChat),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16.26),

              ContactTile(
                title: 'اتصل بنا',
                icon: Icons.phone_outlined,
                onPressed: () => _callSupport(),
              ),

              const SizedBox(height: 16.26),

              ContactTile(
                title: 'الدعم عبر البريد الإلكتروني',
                icon: Icons.mail_outline,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TechnicalSupportsScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 32),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الأسئلة الأكثر شيوعاً',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: TColors.PrimaryColor,
                  ),
                ),
              ),

              const SizedBox(height: 16.26),

              const FaqTile(
                title: 'كيف يمكنني إلغاء الحجز؟',
                answer:
                'يمكنك إلغاء الحجز من خلال التواصل مع مالك العقار عبر المحادثة، ثم الاتفاق معه على إلغاء الطلب. وفي حال واجهت أي مشكلة يمكنك التواصل مع الدعم الفني لمساعدتك.',
              ),

              const SizedBox(height: 8),

              const FaqTile(
                title: 'هل الدفع عبر التطبيق آمن؟',
                answer:
                'حالياً الدفع لا يتم مباشرة داخل التطبيق، بل يتم الاتفاق بين المستأجر ومالك العقار. لذلك ننصحك بإرسال إشعار أو إثبات الدفع داخل المحادثة والاحتفاظ بنسخة منه لضمان حقوقك.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}