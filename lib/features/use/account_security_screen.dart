import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';

class AccountSecurityScreen extends StatelessWidget {
  const AccountSecurityScreen({super.key});

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
            icon: const Icon(
              Icons.arrow_back,
              color: TColors.PrimaryColor,
            ),
          ),
          title: const Text(
            "RentEase",
            style: TextStyle(
              color: TColors.PrimaryColor,
              fontWeight: FontWeight.w800,
              fontSize: 22,
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
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "الحساب والأمان",
                style: TextStyle(
                  color: TColors.PrimaryColor,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 12),

              Text(
                "إدارة خصوصيتك وأمانك ووصولك إلى\nخدمات RentEase.",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff696969),
                  fontSize: 15,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 36),

              _SecurityProgressCard(),

              SizedBox(height: 28),

              _IdentityCard(),

              SizedBox(height: 42),

              _SectionTitle(title: "إعدادات الدخول"),

              SizedBox(height: 14),

              _SettingItem(
                icon: Iconsax.key,
                title: "تغيير كلمة المرور",
                subtitle: "آخر تغيير قبل 3 أشهر",
              ),

              SizedBox(height: 36),

              _SectionTitle(title: "الخصوصية والبيانات"),

              SizedBox(height: 14),

              _SettingItem(
                icon: Iconsax.eye_slash,
                title: "خصوصية الحساب",
                subtitle: "إدارة من يستطيع رؤية ملفك الشخصي",
              ),

              SizedBox(height: 16),

              _SettingItem(
                icon: Iconsax.monitor,
                title: "الأجهزة المرتبطة",
                subtitle: "3 أجهزة نشطة حالياً",
              ),

              SizedBox(height: 38),

              _HelpCard(),

              SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}

class _SecurityProgressCard extends StatelessWidget {
  const _SecurityProgressCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          const Text(
            "حسابك مؤمن بشكل جيد",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TColors.PrimaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            "لقد قمت بتفعيل معظم ميزات الأمان\n"
                "المهمة، استمر في الحفاظ على تحديث\n"
                "بياناتك.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff707070),
              fontSize: 14,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 26),

          Row(
            children: [
              const Text(
                "85%",
                style: TextStyle(
                  color: TColors.PrimaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const LinearProgressIndicator(
                    minHeight: 7,
                    value: 0.85,
                    backgroundColor: Color(0xffE6E6E6),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xff2F3842),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IdentityCard extends StatelessWidget {
  const _IdentityCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: double.infinity,
      decoration: BoxDecoration(
        color: TColors.PrimaryColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.shield_tick,
            color: Colors.white,
            size: 34,
          ),
          SizedBox(height: 15),
          Text(
            "تم التحقق من الهوية",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xff303030),
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: const Color(0xffF1F1F1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios_new,
            color: TColors.PrimaryColor,
            size: 17,
          ),

          const Spacer(),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xff202020),
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xff777777),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(width: 18),

          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              icon,
              color: TColors.PrimaryColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class _HelpCard extends StatelessWidget {
  const _HelpCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
      decoration: BoxDecoration(
        color: const Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Text(
            "هل تحتاج للمساعدة؟",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff303030),
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "مركز الدعم متاح 24/7 للإجابة على\n"
                "استفساراتك حول أمان الحساب.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff686868),
              fontSize: 14,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 22),

          SizedBox(
            width: 125,
            height: 46,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.PrimaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "تواصل معنا",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
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