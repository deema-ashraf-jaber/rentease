import 'package:flutter/material.dart';
import 'package:rentease/features/shope/screens/addProperty/widgets/custom_input.dart';
import 'package:rentease/features/shope/screens/addProperty/widgets/field_title.dart';
import 'package:rentease/features/shope/screens/addProperty/widgets/property_steps.dart';
import 'package:rentease/features/shope/screens/addProperty/widgets/upload_images_box.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

  static const Color primary = Color(0xff183B66);
  static const Color greyBg = Color(0xffEEEEEE);
  static const Color textGrey = Color(0xff9E9E9E);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "RentEase",
            style: TextStyle(
              color: primary,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.notifications_none, color: primary),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: CircleAvatar(
                backgroundColor: Color(0xffE8D8C8),
                child: Image(image: AssetImage(TImages.user)),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(height: 1, color: Color(0xffF5F5F5)),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 30),

                    const PropertySteps(),

                    const SizedBox(height: 48),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "إضافة عقار جديد",
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: TColors.PrimaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    const SizedBox(height: 7),

                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "املأ البيانات التالية لإدراج عقارك في المنصة",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff8C8C8C),
                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 38),

                    const UploadImagesBox(),

                    const SizedBox(height: 40),

                    const FieldTitle("عنوان الإعلان"),
                    const CustomInput(hint: "مثال: شقة مودرن في منطقة الرأس"),

                    const SizedBox(height: 22),

                    const FieldTitle("نوع العقار"),
                    Container(
                      height: 56,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: greyBg,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "شقة",
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: const Color(0xff6B7280),
                              ),
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down, color: Color(0xff6D7280)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    const FieldTitle("السعر السنوي (شيكل)"),
                    const CustomInput(hint: "00,000"),

                    const SizedBox(height: 22),

                    const FieldTitle("الموقع"),
                    const CustomInput(
                      hint: "ابحث عن المدينة أو الحي",
                      icon: Icons.location_on_outlined,
                    ),

                    const SizedBox(height: 22),

                    const FieldTitle("وصف العقار"),
                    Container(
                      height: 130,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                      decoration: BoxDecoration(
                        color: const Color(0xffE8E8E8),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "اكتب تفاصيل إضافية عن العقار والمميزات...",
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: const Color(0xff6B728080).withOpacity(0.50),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 65),

                    SizedBox(
                      height: 64,
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: primary, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: const Text(
                          "إرسال الطلب للمراجعة",
                          style: TextStyle(
                            color: primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Center(
                      child: Text(
                        "بضغطك على إرسال أنت توافق على شروط وأحكام RentEsea",
                        style: TextStyle(
                          color: Color(0xff9B9B9B),
                          fontSize: 11,
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}