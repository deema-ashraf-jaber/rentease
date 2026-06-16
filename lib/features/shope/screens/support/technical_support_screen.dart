import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:rentease/utils/constants/colors.dart';

class TechnicalSupportScreen extends StatelessWidget {
  const TechnicalSupportScreen({super.key});

  static const Color backgroundColor = Color(0xffF7F7F7);
  static const Color cardColor = Color(0xffF1F1F1);
  static const Color fieldColor = Color(0xffEEEEEE);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: TColors.PrimaryColor,
            ),
          ),
          title: const Text(
            'RentEase',
            style: TextStyle(
              color: TColors.PrimaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 18),
              child: Icon(
                Icons.help_outline,
                color: TColors.PrimaryColor,
                size: 25,
              ),
            ),
          ],
        ),

        bottomNavigationBar: const _CustomBottomNav(),

        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
          child: Column(
            children: const [
              SizedBox(height: 8),

              Icon(
                Iconsax.message_question,
                color: TColors.PrimaryColor,
                size: 34,
              ),

              SizedBox(height: 18),

              Text(
                'الدعم الفني',
                style: TextStyle(
                  color: TColors.PrimaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),

              SizedBox(height: 16),

              Text(
                'أرسل لنا استفسارك عبر البريد الإلكتروني وسنقوم\n'
                    'بالرد عليك في أقرب وقت ممكن.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 15,
                  height: 1.7,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 46),

              _SupportFormCard(),

              SizedBox(height: 64),

              _InfoCard(
                icon: Iconsax.clock,
                title: 'أوقات العمل',
                description:
                'نحن متواجدون لمساعدتك من الأحد إلى الخميس، ٩\n'
                    'صباحاً - ٦ مساءً.',
              ),

              SizedBox(height: 42),

              _InfoCard(
                icon: Iconsax.shield_tick,
                title: 'الأمان والخصوصية',
                description:
                'يتم التعامل مع جميع المراسلات بخصوصية تامة وسرية\n'
                    'مطلقة.',
              ),

              SizedBox(height: 34),

              Image(
                image: AssetImage('assets/images/support/support_image.png'),
                height: 210,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}

class _SupportFormCard extends StatelessWidget {
  const _SupportFormCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 24, 18, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 14,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: const [
          _InputField(
            title: 'الموضوع',
            hintText: 'ما هو موضوع استفسارك؟',
            height: 58,
            maxLines: 1,
          ),

          SizedBox(height: 26),

          _InputField(
            title: 'الرسالة',
            hintText: 'اكتب تفاصيل رسالتك هنا...',
            height: 160,
            maxLines: 6,
          ),

          SizedBox(height: 24),

          _SendButton(),
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.title,
    required this.hintText,
    required this.height,
    required this.maxLines,
  });

  final String title;
  final String hintText;
  final double height;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: TColors.PrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(
              Iconsax.message_text,
              color: TColors.PrimaryColor,
              size: 17,
            ),
          ],
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: height,
          child: TextField(
            maxLines: maxLines,
            textAlign: TextAlign.right,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xff888888),
                fontSize: 14,
              ),
              filled: true,
              fillColor: TechnicalSupportScreen.fieldColor,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.PrimaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'إرسال الرسالة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Iconsax.send_1,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 34, 20, 34),
      decoration: BoxDecoration(
        color: TechnicalSupportScreen.cardColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: TColors.PrimaryColor,
            size: 30,
          ),

          const SizedBox(width: 28),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: TColors.PrimaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  description,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xff555555),
                    fontSize: 14,
                    height: 1.6,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
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
          _NavItem(icon: Iconsax.home_2, label: 'الرئيسية'),
          _NavItem(icon: Iconsax.search_normal, label: 'بحث'),
          _NavItem(icon: Iconsax.add_circle, label: 'إضافة'),
          _NavItem(icon: Iconsax.heart, label: 'المفضلة'),
          _NavItem(
            icon: Iconsax.user,
            label: 'الحساب',
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
        color: isSelected ? TColors.PrimaryColor : Colors.transparent,
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