import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentease/bottom_navigation.dart';
import 'package:rentease/features/shope/screens/chats/support_chat_helper.dart';
import 'package:rentease/features/shope/screens/search/search.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../utils/constants/image_strings.dart';
import '../chats/models/chat_model.dart';
import '../chats/one_chats/one_chats.dart';

class HowToUseScreen extends StatelessWidget {
  const HowToUseScreen({super.key});

  static const Color primaryColor = Color(0xFF1B3C73);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF7F7F7),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: primaryColor),
          ),
          title: const Text(
            "RentEase",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 18),
              child: Icon(
                Icons.help_outline,
                color: primaryColor,
                size: 25,
              ),
            ),
          ],
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
          child: Column(
            children: [
              const Text(
                "كيفية الاستخدام",
                style: TextStyle(
                  fontSize: 32,
                  color: primaryColor,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "دليلك البسيط لاستخدام تطبيق RentEase\n"
                    "والحصول على أفضل تجربة لتأجير العقارات.\n"
                    "هل أنت جاهز للبدء؟",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff565656),
                  fontSize: 15,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 22),

              const _ExploreButton(),

              const SizedBox(height: 34),

               _ImageStepCard(
                number: "01",
                icon: Iconsax.search_normal,
                title: "البحث والاستكشاف",
                description:
                "استخدم ميزة البحث المتقدم لتحديد الموقع،\nالسعر، ونوع العقار الذي تبحث عنه.",
                image: TImages.howuse1,
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const BottomNavigationScreen(initialIndex: 1,),
                     ),
                   );
                 },
              ),

               _ImageStepCard(
                number: "02",
                icon: Iconsax.building,
                title: "معاينة التفاصيل",
                description:
                "تصفح الصور والوصف الدقيق والمرافق\nالمتاحة في كل عقار قبل اتخاذ قرارك.",
                image: TImages.howuse2,
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const BottomNavigationScreen(),
                     ),
                   );
                 },
              ),

              _ImageStepCard(
                number: "03",
                icon: Iconsax.calendar_tick,
                title: "الحجز الفوري",
                description:
                "حدد التواريخ المناسبة لك وأرسل طلب الحجز\nبضغطة زر واحدة بكل سهولة وأمان.",
                image: TImages.howuse3,
                onTap: (){

                },
              ),

              const _PaymentCard(),

              const _SupportCard(),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExploreButton extends StatelessWidget {
  const _ExploreButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: HowToUseScreen.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationScreen(),
            ),
          );
        },
        child: const Text(
          "استكشف العقارات الآن",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}

class _ImageStepCard extends StatelessWidget {
  const _ImageStepCard({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
  });

  final String number;
  final IconData icon;
  final String title;
  final String description;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            _CardHeader(number: number, icon: icon),

            const SizedBox(height: 18),

            Text(
              title,
              style: const TextStyle(
                color: HowToUseScreen.primaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff5F5F5F),
                fontSize: 14,
                height: 1.6,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 18),

            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.asset(
                image,
                height: 155,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentCard extends StatelessWidget {
  const _PaymentCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
      decoration: BoxDecoration(
        color: const Color(0xffF1F1F1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const _CardHeader(
            number: "04",
            icon: Iconsax.money,
          ),

          const SizedBox(height: 18),

          const Text(
            "الدفع الآمن",
            style: TextStyle(
              color: HowToUseScreen.primaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "طرق دفع متعددة ومشفرة لضمان أمان\n"
                "معاملاتك المالية داخل المنصة.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff4F4F4F),
              fontSize: 15,
              height: 1.55,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 24),

          Container(
            height: 72,
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PaymentIcon(icon: Iconsax.money),
                _PaymentIcon(icon: Iconsax.wallet_2),
                _PaymentIcon(icon: Iconsax.card),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SupportCard extends StatelessWidget {
  const _SupportCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const _CardHeader(
            number: "05",
            icon: Iconsax.headphone,
          ),

          const SizedBox(height: 18),

          const Text(
            "الدعم الفني",
            style: TextStyle(
              color: HowToUseScreen.primaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "فريقنا متواجد دائماً لمساعدتك في أي\n"
                "استفسار طوال رحلة استئجارك.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff4F4F4F),
              fontSize: 15,
              height: 1.55,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF1F1F1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              onPressed:(){ SupportChatHelper.openSupportChat(context);},
              child: const Text(
                "مركز المساعدة",
                style: TextStyle(
                  color: HowToUseScreen.primaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({
    required this.number,
    required this.icon,
  });

  final String number;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 54,
            color: Color(0xffECECEC),
            fontWeight: FontWeight.w800,
          ),
        ),

        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: HowToUseScreen.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
        ),
      ],
    );
  }
}

class _PaymentIcon extends StatelessWidget {
  const _PaymentIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(
          color: HowToUseScreen.primaryColor,
          width: 1.5,
        ),
      ),
      child: Icon(
        icon,
        color: HowToUseScreen.primaryColor,
        size: 22,
      ),
    );
  }
}


