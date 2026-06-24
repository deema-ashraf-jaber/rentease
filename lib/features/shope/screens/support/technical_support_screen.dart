import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:rentease/utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class TechnicalSupportsScreen extends StatefulWidget {
  const TechnicalSupportsScreen({super.key});

  static const Color backgroundColor = Color(0xffF7F7F7);
  static const Color cardColor = Color(0xffF1F1F1);
  static const Color fieldColor = Color(0xffEEEEEE);

  @override
  State<TechnicalSupportsScreen> createState() =>
      _TechnicalSupportsScreenState();
}

class _TechnicalSupportsScreenState extends State<TechnicalSupportsScreen> {
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  final String supportEmail = 'support@rentease.com';

  bool isLoading = false;

  Future<void> sendSupportMessage() async {
    final subject = subjectController.text.trim();
    final message = messageController.text.trim();

    if (subject.isEmpty || message.isEmpty) {
      showMessage('الرجاء تعبئة الموضوع والرسالة');
      return;
    }

    setState(() => isLoading = true);

    await Future.delayed(const Duration(milliseconds: 700));

    // TODO Supabase:
    // هنا لاحقاً نخزن الاستفسار في جدول support_messages
    //
    // await Supabase.instance.client.from('support_messages').insert({
    //   'subject': subject,
    //   'message': message,
    //   'support_email': supportEmail,
    //   'status': 'new',
    //   'created_at': DateTime.now().toIso8601String(),
    //   // 'user_id': Supabase.instance.client.auth.currentUser!.id,
    // });
    //
    // ممكن كمان لاحقاً تعملوا Edge Function ترسل الرسالة فعلياً للبريد:
    // supportEmail

    setState(() => isLoading = false);

    subjectController.clear();
    messageController.clear();

    showMessage('تم إرسال استفسارك بنجاح، وسيتم الرد عليك في أقرب وقت.');
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: TColors.PrimaryColor,
        content: Text(
          message,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  @override
  void dispose() {
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: TechnicalSupportsScreen.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: TColors.PrimaryColor),
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Icon(
                Iconsax.message_question,
                color: TColors.PrimaryColor,
                size: 34,
              ),
              const SizedBox(height: 18),
              const Text(
                'الدعم الفني',
                style: TextStyle(
                  color: TColors.PrimaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
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
              const SizedBox(height: 46),

              _SupportFormCard(
                subjectController: subjectController,
                messageController: messageController,
                isLoading: isLoading,
                onSend: sendSupportMessage,
              ),

              const SizedBox(height: 64),

              const _InfoCard(
                icon: Iconsax.clock,
                title: 'أوقات العمل',
                description:
                'نحن متواجدون لمساعدتك من الأحد إلى الخميس، ٩\n'
                    'صباحاً - ٦ مساءً.',
              ),

              const SizedBox(height: 42),

              const _InfoCard(
                icon: Iconsax.shield_tick,
                title: 'الأمان والخصوصية',
                description:
                'يتم التعامل مع جميع المراسلات بخصوصية تامة وسرية\n'
                    'مطلقة.',
              ),

              const SizedBox(height: 34),

              const Image(
                image: AssetImage(TImages.support_image),
                height: 210,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}

class _SupportFormCard extends StatelessWidget {
  const _SupportFormCard({
    required this.subjectController,
    required this.messageController,
    required this.isLoading,
    required this.onSend,
  });

  final TextEditingController subjectController;
  final TextEditingController messageController;
  final bool isLoading;
  final VoidCallback onSend;

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
        children: [
          _InputField(
            title: 'الموضوع',
            hintText: 'ما هو موضوع استفسارك؟',
            height: 58,
            maxLines: 1,
            controller: subjectController,
          ),
          const SizedBox(height: 26),
          _InputField(
            title: 'الرسالة',
            hintText: 'اكتب تفاصيل رسالتك هنا...',
            height: 160,
            maxLines: 6,
            controller: messageController,
          ),
          const SizedBox(height: 24),
          _SendButton(
            isLoading: isLoading,
            onPressed: onSend,
          ),
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
    required this.controller,
  });

  final String title;
  final String hintText;
  final double height;
  final int maxLines;
  final TextEditingController controller;

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
            controller: controller,
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
              fillColor: TechnicalSupportsScreen.fieldColor,
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
  const _SendButton({
    required this.isLoading,
    required this.onPressed,
  });

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.PrimaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Row(
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
        color: TechnicalSupportsScreen.cardColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: TColors.PrimaryColor, size: 30),
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