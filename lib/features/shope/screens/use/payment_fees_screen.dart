import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentease/features/shope/screens/chats/chats.dart';
import 'package:rentease/utils/constants/colors.dart';

class PaymentFeesScreen extends StatefulWidget {
  const PaymentFeesScreen({super.key});

  static const Color backgroundColor = Color(0xffF7F7F7);
  static const Color titleColor = Color(0xff6B788A);
  static const Color darkValueColor = Color(0xff1F3B63);
  static const Color greyText = Color(0xff9E9E9E);
  static const Color xBoxColor = Color(0xffE6E6E6);

  @override
  State<PaymentFeesScreen> createState() => _PaymentFeesScreenState();
}

class _PaymentFeesScreenState extends State<PaymentFeesScreen> {
  String selectedPayment = 'banks';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: PaymentFeesScreen.backgroundColor,
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            children: [
              const _AmountCard(),

              const SizedBox(height: 34),

              const Row(
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

              const SizedBox(height: 46),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اختر الوسيلة المناسبة',
                    style: TextStyle(
                      color: PaymentFeesScreen.greyText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'طرق الدفع',
                    style: TextStyle(
                      color: PaymentFeesScreen.titleColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              _PaymentMethodItem(
                isSelected: selectedPayment == 'banks',
                icon: Iconsax.bank,
                title: 'بنوك',
                subtitle: 'تحويل بنكي مباشر لبنك فلسطين، بنك القاهرة عمان، إلخ',
                onTap: () {
                  setState(() {
                    selectedPayment = 'banks';
                  });
                },
              ),

              const SizedBox(height: 18),

              _PaymentMethodItem(
                isSelected: selectedPayment == 'wallets',
                icon: Icons.account_balance_wallet_outlined,
                title: 'محافظ إلكترونية',
                subtitle: 'stc pay, Apple Pay, UrPay',
                onTap: () {
                  setState(() {
                    selectedPayment = 'wallets';
                  });
                },
              ),

              const SizedBox(height: 18),

              _PaymentMethodItem(
                isSelected: selectedPayment == 'cards',
                icon: Iconsax.card,
                title: 'بطاقات ائتمانية',
                subtitle: 'مدى، فيزا، ماستركارد',
                onTap: () {
                  setState(() {
                    selectedPayment = 'cards';
                  });
                },
              ),

              const SizedBox(height: 36),

              const _NoteBox(),

              const SizedBox(height: 42),

              _ConfirmButton(selectedPayment: selectedPayment),

              const SizedBox(height: 35),
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
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 94),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xffF1F1F1),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? TColors.PrimaryColor : Colors.transparent,
            width: 1.2,
          ),
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
                      color: isSelected
                          ? const Color(0xff333333)
                          : const Color(0xff9C9C9C),
                      fontSize: 19,
                      fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isSelected
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
              decoration: BoxDecoration(
                color: isSelected
                    ? TColors.PrimaryColor.withOpacity(0.08)
                    : PaymentFeesScreen.xBoxColor,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: isSelected ? TColors.PrimaryColor : const Color(0xff8F8F8F),
                size: 30,
              ),
            ),
          ],
        ),
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
              'اختر طريقة الدفع، ثم تواصل مع مالك العقار عبر المحادثات وأرسل له إشعار أو إثبات الدفع لإكمال عملية الحجز.',
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
  const _ConfirmButton({
    required this.selectedPayment,
  });

  final String selectedPayment;

  String get paymentText {
    if (selectedPayment == 'banks') return 'بنوك';
    if (selectedPayment == 'wallets') return 'محافظ إلكترونية';
    return 'بطاقات ائتمانية';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO Supabase:
          // لاحقاً ممكن نحفظ طريقة الدفع المختارة:
          // selectedPayment = banks / wallets / cards
          // داخل جدول payments أو bookings

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ChatsScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.PrimaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: const Text(
          'الإنتقال الى الدردشات',
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