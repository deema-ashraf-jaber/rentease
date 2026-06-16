import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:rentease/utils/constants/colors.dart';

class PaymentFeesScreen extends StatelessWidget {
  const PaymentFeesScreen({super.key});

  static const Color backgroundColor = Color(0xffF7F7F7);
  static const Color titleColor = Color(0xff6B788A);
  static const Color darkValueColor = Color(0xff1F3B63);
  static const Color greyText = Color(0xff9E9E9E);
  static const Color xBoxColor = Color(0xffE6E6E6);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: TColors.PrimaryColor),
          ),
          title: const Text(
            'الرسوم والمدفوعات',
            style: TextStyle(
              color: TColors.PrimaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        bottomNavigationBar: const _CustomBottomNav(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            children: const [
              _AmountCard(),

              SizedBox(height: 34),

              Row(
                children: [
                  Expanded(
                    child: _PaymentInfoItem(
                      icon: Iconsax.document_text,
                      title: 'رقم الطلب',
                      value: '#RE-8821',
                    ),
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: _PaymentInfoItem(
                      icon: Iconsax.calendar_1,
                      title: 'تاريخ الاستحقاق',
                      value: '15 يونيو',
                    ),
                  ),
                ],
              ),

              SizedBox(height: 46),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اختر الوسيلة المناسبة',
                    style: TextStyle(
                      color: greyText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'طرق الدفع',
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),

              _PaymentMethodItem(
                isSelected: true,
                isActive: true,
                title: 'بنوك',
                subtitle: 'تحويل بنكي مباشر لبنك فلسطين، بنك القاهرة عمان، إلخ',
              ),

              SizedBox(height: 18),

              _PaymentMethodItem(
                title: 'محافظ إلكترونية',
                subtitle: 'stc pay, Apple Pay, UrPay',
              ),

              SizedBox(height: 18),

              _PaymentMethodItem(
                title: 'بطاقات ائتمانية',
                subtitle: 'مدى، فيزا، ماستركارد',
              ),

              SizedBox(height: 36),

              _NoteBox(),

              SizedBox(height: 42),

              _ConfirmButton(),

              SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}

class _AmountCard extends StatelessWidget {
  const _AmountCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 14,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'إجمالي المستحق',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff6F6F6F),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '2,450',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TColors.PrimaryColor,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentInfoItem extends StatelessWidget {
  const _PaymentInfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Icon(icon, color: TColors.PrimaryColor, size: 28),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff8D8D8D),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: PaymentFeesScreen.darkValueColor,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodItem extends StatelessWidget {
  const _PaymentMethodItem({
    required this.title,
    required this.subtitle,
    this.isSelected = false,
    this.isActive = false,
  });

  final String title;
  final String subtitle;
  final bool isSelected;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 94),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xffF1F1F1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? TColors.PrimaryColor : const Color(0xffC8C8C8),
            size: 27,
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: isActive
                        ? const Color(0xff333333)
                        : const Color(0xff9C9C9C),
                    fontSize: 19,
                    fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isActive
                        ? const Color(0xff8A8A8A)
                        : const Color(0xffA8A8A8),
                    fontSize: 12,
                    height: 1.15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 14),

          Container(
            width: 58,
            height: 58,
            color: PaymentFeesScreen.xBoxColor,
            alignment: Alignment.center,
            child: const SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Icon(
                  Icons.close,
                  color: Color(0xff8F8F8F),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NoteBox extends StatelessWidget {
  const _NoteBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xffF1F1F1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Iconsax.info_circle,
            color: Color(0xff777777),
            size: 24,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'سيتم تأكيد عملية الدفع خلال 24 ساعة عمل عند\n'
                  'اختيار التحويل البنكي، يرجى إرفاق صورة الإيصال في\n'
                  'الخطوة التالية.',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 14,
                height: 1.7,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
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
        child: const Text(
          'تأكيد الدفع',
          style: TextStyle(
            color: Color(0xffF2F2F2),
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(icon: Iconsax.home_2, label: 'الرئيسية'),
          _NavItem(icon: Iconsax.search_normal, label: 'بحث'),
          _NavItem(icon: Iconsax.add_circle, label: 'إضافة'),
          _NavItem(icon: Iconsax.heart, label: 'المفضلة'),
          _NavItem(icon: Iconsax.user, label: 'الحساب', isSelected: true),
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