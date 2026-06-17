import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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

        bottomNavigationBar: const _CustomBottomNav(),

        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
          child: Column(
            children: const [
              Text(
                "كيفية الاستخدام",
                style: TextStyle(
                  fontSize: 32,
                  color: primaryColor,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 10),

              Text(
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

              SizedBox(height: 22),

              _ExploreButton(),

              SizedBox(height: 34),

              _ImageStepCard(
                number: "01",
                icon: Iconsax.search_normal,
                title: "البحث والاستكشاف",
                description:
                "استخدم ميزة البحث المتقدم لتحديد الموقع،\nالسعر، ونوع العقار الذي تبحث عنه.",
                image: "assets/images/howtoUse/step1.png",
              ),

              _ImageStepCard(
                number: "02",
                icon: Iconsax.building,
                title: "معاينة التفاصيل",
                description:
                "تصفح الصور والوصف الدقيق والمرافق\nالمتاحة في كل عقار قبل اتخاذ قرارك.",
                image: "assets/images/howtoUse/step2.png",
              ),

              _ImageStepCard(
                number: "03",
                icon: Iconsax.calendar_tick,
                title: "الحجز الفوري",
                description:
                "حدد التواريخ المناسبة لك وأرسل طلب الحجز\nبضغطة زر واحدة بكل سهولة وأمان.",
                image: "assets/images/howtoUse/step3.png",
              ),

              _PaymentCard(),

              _SupportCard(),

              SizedBox(height: 25),
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
        onPressed: () {},
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
  });

  final String number;
  final IconData icon;
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onPressed: () {},
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

class _CustomBottomNav extends StatelessWidget {
  const _CustomBottomNav();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(icon: Iconsax.home_2, label: "الرئيسية"),
          _NavItem(icon: Iconsax.search_normal, label: "بحث"),
          _NavItem(icon: Iconsax.add_circle, label: "إضافة"),
          _NavItem(icon: Iconsax.heart, label: "المفضلة"),
          _NavItem(
            icon: Iconsax.user,
            label: "الحساب",
            isSelected: true,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSelected ? 72 : 54,
      height: 66,
      decoration: BoxDecoration(
        color: isSelected
            ? HowToUseScreen.primaryColor
            : Colors.transparent,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : const Color(0xffA7AAB0),
            size: 24,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xffA7AAB0),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}