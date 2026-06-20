
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';
import 'package:rentease/utils/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/constants/image_strings.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  static const Color refundBoxColor = Color(0xFF6C8FC9);
  static const Color softGreyBox = Color(0xffF1F1F1);
  static const Color pdfButtonGrey = Color(0xffE2E2E2);

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
            icon: const Icon(Icons.arrow_back, color: TColors.PrimaryColor),
          ),
          title: const Text(
            'RentEase',
            style: TextStyle(
              color: TColors.PrimaryColor,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 18),
              child: Icon(
                Icons.help_outline,
                color: TColors.PrimaryColor,
                size: 26,
              ),
            ),
          ],
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            children: [
              Text(
                'LEGAL DOCUMENT',
                style: TextStyle(
                  color: TColors.PrimaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'شروط الخدمة',
                style: TextStyle(
                  color: TColors.PrimaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 22),
              Text(
                'يرجى قراءة هذه الشروط بعناية قبل استخدام\n'
                    'منصة RentEase. من خلال الوصول إلى خدماتنا،\n'
                    'فإنك توافق على الالتزام بالبنود الموضحة أدناه.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 18,
                  height: 1.9,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.calendar_1,
                    size: 18,
                    color: Color(0xff9A9A9A),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'آخر تحديث: 16 أبريل 2026',
                    style: TextStyle(
                      color: Color(0xff9A9A9A),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 86),

              _TextSection(
                number: '01',
                numberAlignment: Alignment.topRight,
                title: 'المقدمة والقبول',
                body:
                'هذه الاتفاقية تحكم استخدامك\n'
                    'لتطبيق RentEase وموقعه\n'
                    'الإلكتروني. يعتبر استخدامك للتطبيق\n'
                    'بمثابة موافقة صريحة وكاملة على\n'
                    'كافة الشروط والأحكام الواردة هنا. إذا\n'
                    'كنت لا توافق على أي جزء من هذه\n'
                    'الشروط، يرجى عدم استخدام المنصة.',
              ),

              SizedBox(height: 80),

              _AccountResponsibilitySection(),

              SizedBox(height: 80),

              _FeesCard(),

              SizedBox(height: 80),

              _ForbiddenSection(),

              SizedBox(height: 95),

              Text(
                'هل لديك استفسار حول هذه البنود؟',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColors.PrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'فريقنا القانوني متاح دائماً لتوضيح أي نقطة غامضة.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 16,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 28),
              _SupportButton(),
              SizedBox(height: 14),
              _PdfButton(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextSection extends StatelessWidget {
  const _TextSection({
    required this.number,
    required this.title,
    required this.body,
    this.numberAlignment = Alignment.topRight,
  });

  final String number;
  final String title;
  final String body;
  final Alignment numberAlignment;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(22, 36, 22, 36),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 18,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: numberAlignment,
              child: Text(
                number,
                style: const TextStyle(
                  color: Color(0xffECECEC),
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: TColors.PrimaryColor,
                    fontSize: 31,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff444444),
                    fontSize: 18,
                    height: 1.9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountResponsibilitySection extends StatelessWidget {
  const _AccountResponsibilitySection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 34, 22, 28),
      decoration: BoxDecoration(
        color: TermsOfServiceScreen.softGreyBox,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Column(
        children: [
          _SectionHeader(
            number: '02',
            numberAlignment: Alignment.centerRight,
            title: 'مسؤوليات الحساب',
          ),
          SizedBox(height: 26),
          Text(
            'أمان حسابك هو أولويتنا، ولكنك\n'
                'المسؤول الأول عن حماية بيانات\n'
                'الوصول الخاصة بك.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff444444),
              fontSize: 18,
              height: 1.75,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 28),
          Image(
            image: AssetImage(TImages.termsofuse),
            height: 270,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.number,
    required this.title,
    this.numberAlignment = Alignment.centerRight,
  });

  final String number;
  final String title;
  final Alignment numberAlignment;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: numberAlignment,
          child: Text(
            number,
            style: const TextStyle(
              color: Color(0xffE5E5E5),
              fontSize: 34,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: TColors.PrimaryColor,
            fontSize: 30,
            height: 1.25,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class _FeesCard extends StatelessWidget {
  const _FeesCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 36, 28, 32),
      decoration: BoxDecoration(
        color: TColors.PrimaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          const Text(
            'الرسوم والمدفوعات',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 34),
          const Text(
            'تخضع جميع عمليات الدفع عبر RentEase\n'
                'لسياسات الشفافية والأمان. نحن نضمن\n'
                'حماية معاملاتك المالية واستخدام بوابات دفع\n'
                'معتمدة عالمياً.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              height: 1.9,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 34),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            decoration: BoxDecoration(
              color: TermsOfServiceScreen.refundBoxColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 4,
                  bottom: -14,
                  child: Text(
                    'PAY',
                    style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.w900,
                      color: Colors.white.withOpacity(0.12),
                    ),
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      'سياسة الاسترداد:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'تتم معالجة طلبات الاسترداد خلال ٧-١٤ يوم عمل\n'
                          'بناءً على نوع الخدمة والشروط الخاصة بكل عملية\n'
                          'تأجير.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        height: 1.8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ForbiddenSection extends StatelessWidget {
  const _ForbiddenSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 34, 20, 28),
      decoration: BoxDecoration(
        color: TermsOfServiceScreen.softGreyBox,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: const [
          _SectionHeader(
            number: '04',
            numberAlignment: Alignment.centerRight,
            title: 'الاستخدامات\nالمحظورة',
          ),
          SizedBox(height: 30),
          _ForbiddenItem(text: 'انتحال هوية مستخدم آخر'),
          _ForbiddenItem(text: 'استخدام المنصة لأغراض\nغير قانونية'),
          _ForbiddenItem(text: 'محاولة اختراق أنظمة\nالمنصة'),
          _ForbiddenItem(text: 'نشر محتوى مسيء أو غير\nلائق'),
        ],
      ),
    );
  }
}

class _ForbiddenItem extends StatelessWidget {
  const _ForbiddenItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xff202020),
                fontSize: 16,
                height: 1.45,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Icon(
            Icons.block,
            color: Color(0xffA94438),
            size: 24,
          ),
        ],
      ),
    );
  }
}

class _SupportButton extends StatelessWidget {
  const _SupportButton();

  Future<void> _callSupport() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '0599999999');

    if (!await launchUrl(phoneUri)) {
      throw Exception('Could not launch phone');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.PrimaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: _callSupport,
        child: const Text(
          'اتصل بمركز الدعم',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class _PdfButton extends StatelessWidget {
  const _PdfButton();

  Future<void> _downloadPdf(BuildContext context) async {
    final pdf = pw.Document();

    final cairoFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/Cairo-Regular.ttf'),
    );

    final titleStyle = pw.TextStyle(
      font: cairoFont,
      fontSize: 20,
      fontWeight: pw.FontWeight.bold,
    );

    final bodyStyle = pw.TextStyle(
      font: cairoFont,
      fontSize: 13,
      lineSpacing: 5,
    );

    List<pw.Widget> section(String title, String body) {
      return [
        pw.Text(title, textAlign: pw.TextAlign.right, style: titleStyle),
        pw.SizedBox(height: 8),
        pw.Text(body, textAlign: pw.TextAlign.right, style: bodyStyle),
        pw.SizedBox(height: 18),
      ];
    }

    pdf.addPage(
      pw.MultiPage(
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(
          base: cairoFont,
          bold: cairoFont,
        ),
        build: (context) => [
          pw.Center(
            child: pw.Text(
              'شروط الخدمة - RentEase',
              style: pw.TextStyle(
                font: cairoFont,
                fontSize: 24,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(height: 25),

          ...section(
            '1. المقدمة والقبول',
            'مرحباً بك في RentEase. باستخدامك للتطبيق أو إنشاء حساب أو تصفح العقارات المعروضة، فإنك توافق على الالتزام بجميع الشروط والأحكام الواردة في هذه الوثيقة.',
          ),

          ...section(
            '2. مسؤوليات المستخدم والحساب',
            'يتحمل المستخدم المسؤولية الكاملة عن صحة البيانات التي يقوم بإدخالها داخل التطبيق، كما يلتزم بالحفاظ على سرية بيانات تسجيل الدخول وعدم مشاركتها مع أي طرف آخر.',
          ),

          ...section(
            '3. العقارات والإعلانات',
            'يتحمل مالك العقار المسؤولية الكاملة عن صحة المعلومات والصور والوصف الخاص بالعقار المضاف إلى المنصة. ويحق لإدارة RentEase مراجعة أو حذف أي إعلان مخالف.',
          ),

          ...section(
            '4. الرسوم والمدفوعات',
            'قد تتطلب بعض الخدمات رسوماً يتم توضيحها للمستخدم قبل إتمام العملية. ويتحمل المستخدم مسؤولية التأكد من صحة بيانات الدفع وإرسال إشعار الدفع عند الحاجة.',
          ),

          ...section(
            '5. سياسة الإلغاء والاسترداد',
            'يمكن للمستخدم طلب إلغاء الحجز أو الاتفاق مع مالك العقار وفقاً للسياسات المتفق عليها بين الطرفين. وتتم مراجعة طلبات الاسترداد خلال فترة زمنية مناسبة.',
          ),

          ...section(
            '6. الاستخدامات المحظورة',
            'يمنع انتحال شخصية مستخدم آخر، أو نشر معلومات مضللة، أو رفع محتوى مسيء، أو محاولة اختراق أنظمة التطبيق، أو استخدام المنصة لأغراض احتيالية أو غير قانونية.',
          ),

          ...section(
            '7. الخصوصية وحماية البيانات',
            'تحترم RentEase خصوصية المستخدمين وتلتزم بحماية المعلومات الشخصية وفقاً لسياسات الأمان المتبعة، ولا يتم مشاركة البيانات إلا عند الحاجة القانونية أو التشغيلية.',
          ),

          ...section(
            '8. حدود المسؤولية',
            'لا تتحمل RentEase مسؤولية أي اتفاقات أو معاملات تتم خارج نطاق المنصة بين المستخدمين، كما لا تتحمل مسؤولية معلومات غير صحيحة يقدمها المستخدمون.',
          ),

          ...section(
            '9. التعديلات على الشروط',
            'تحتفظ إدارة RentEase بحق تعديل هذه الشروط والأحكام في أي وقت بما يتناسب مع تطوير المنصة أو المتطلبات القانونية.',
          ),

          ...section(
            '10. التواصل والدعم',
            'للاستفسار يمكن التواصل مع فريق الدعم الفني.\nالبريد الإلكتروني: support@rentease.com\nرقم الدعم: 0599999999',
          ),
        ],
      ),
    );

    final bytes = await pdf.save();

    await Printing.sharePdf(
      bytes: bytes,
      filename: 'rentease_terms.pdf',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'تم تجهيز ملف PDF بنجاح',
          textAlign: TextAlign.right,
        ),
        backgroundColor: TColors.PrimaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: TermsOfServiceScreen.pdfButtonGrey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () => _downloadPdf(context),
        child: const Text(
          'تحميل نسخة PDF',
          style: TextStyle(
            color: Color(0xff111111),
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}