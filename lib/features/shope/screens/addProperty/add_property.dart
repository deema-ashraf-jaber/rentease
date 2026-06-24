import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentease/features/shope/screens/addProperty/widgets/custom_input.dart';
import 'package:rentease/features/shope/screens/addProperty/widgets/field_title.dart';
import 'package:rentease/features/shope/screens/addProperty/widgets/property_steps.dart';
import 'package:rentease/features/shope/screens/addProperty/widgets/upload_images_box.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../bottom_navigation.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../notifications/notifications.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  static const Color greyBg = Color(0xffEEEEEE);

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  final bedroomsController = TextEditingController();
  final bathroomsController = TextEditingController();
  final areaController = TextEditingController();
  final ownerPhoneController = TextEditingController();
  final ownerEmailController = TextEditingController();

  final List<String> propertyTypes = [
    'شقة',
    'فيلا',
    'بيت مستقل',
    'استوديو',
    'غرفة',
  ];

  String selectedType = 'شقة';
  bool hasParking = false;

  File? selectedImageFile;
  Uint8List? selectedImageBytes;
  String? selectedImageName;

  int activeStep = 1;
  bool isLoading = false;

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedImage == null) return;

    final bytes = await pickedImage.readAsBytes();

    setState(() {
      selectedImageBytes = bytes;
      selectedImageName = pickedImage.name;
      selectedImageFile = kIsWeb ? null : File(pickedImage.path);
      activeStep = 2;
    });
  }

  Future<void> submitProperty() async {
    final title = titleController.text.trim();
    final price = priceController.text.trim();
    final location = locationController.text.trim();
    final description = descriptionController.text.trim();

    final bedrooms = bedroomsController.text.trim();
    final bathrooms = bathroomsController.text.trim();
    final area = areaController.text.trim();
    final ownerPhone = ownerPhoneController.text.trim();
    final ownerEmail = ownerEmailController.text.trim();

    if (selectedImageBytes == null) {
      showMessage('الرجاء تحميل صورة للعقار');
      return;
    }

    if (title.isEmpty ||
        price.isEmpty ||
        location.isEmpty ||
        description.isEmpty ||
        bedrooms.isEmpty ||
        bathrooms.isEmpty ||
        area.isEmpty ||
        ownerPhone.isEmpty ||
        ownerEmail.isEmpty) {
      showMessage('الرجاء تعبئة جميع الحقول');
      return;
    }

    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      showMessage('يجب تسجيل الدخول أولاً');
      return;
    }

    try {
      setState(() {
        activeStep = 4;
        isLoading = true;
      });

      final fileExt = selectedImageName?.split('.').last ?? 'jpg';
      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${user.id}.$fileExt';

      await Supabase.instance.client.storage
          .from('property-images')
          .uploadBinary(
        fileName,
        selectedImageBytes!,
        fileOptions: const FileOptions(
          cacheControl: '3600',
          upsert: false,
        ),
      );

      final imageUrl = Supabase.instance.client.storage
          .from('property-images')
          .getPublicUrl(fileName);

      await Supabase.instance.client.from('properties').insert({
        'owner_id': user.id,
        'title': title,
        'property_type': selectedType,
        'location': location,
        'monthly_price': double.parse(price),
        'bedrooms': int.parse(bedrooms),
        'bathrooms': int.parse(bathrooms),
        'area': double.parse(area),
        'has_parking': hasParking,
        'description': description,
        'image_url': imageUrl,
        'owner_phone': ownerPhone,
        'owner_email': ownerEmail,
        'status': 'pending',
      });

      showMessage('تم إرسال طلب العقار للمراجعة بنجاح');

      titleController.clear();
      priceController.clear();
      locationController.clear();
      descriptionController.clear();
      bedroomsController.clear();
      bathroomsController.clear();
      areaController.clear();
      ownerPhoneController.clear();
      ownerEmailController.clear();

      setState(() {
        selectedImageFile = null;
        selectedImageBytes = null;
        selectedImageName = null;
        selectedType = 'شقة';
        hasParking = false;
        activeStep = 1;
      });
    } on StorageException catch (e) {
      showMessage('خطأ في رفع الصورة: ${e.message}');
    } on PostgrestException catch (e) {
      showMessage('خطأ في حفظ العقار: ${e.message}');
    } catch (e) {
      showMessage('حدث خطأ غير متوقع: $e');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.right),
        backgroundColor: TColors.PrimaryColor,
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    bedroomsController.dispose();
    bathroomsController.dispose();
    areaController.dispose();
    ownerPhoneController.dispose();
    ownerEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: TColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "RentEase",
            style: TextStyle(
              color: TColors.PrimaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsScreen(
                    onSearchPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const BottomNavigationScreen(initialIndex: 1),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              color: TColors.PrimaryColor,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: FutureBuilder(
                future: Supabase.instance.client
                    .from('profiles')
                    .select('profile_image')
                    .eq(
                  'id',
                  Supabase.instance.client.auth.currentUser!.id,
                )
                    .single(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircleAvatar(
                      backgroundColor: Color(0xffE8D8C8),
                      child: Icon(
                        Icons.person,
                        color: TColors.PrimaryColor,
                      ),
                    );
                  }

                  final imageUrl =
                  snapshot.data!['profile_image']?.toString();

                  return CircleAvatar(
                    backgroundColor: const Color(0xffE8D8C8),
                    backgroundImage:
                    imageUrl != null && imageUrl.isNotEmpty
                        ? NetworkImage(imageUrl)
                        : const AssetImage(TImages.user)
                    as ImageProvider,
                  );
                },
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(height: 1, color: Color(0xffF5F5F5)),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(24, 30, 24, 20),
              child: PropertySteps(activeStep: activeStep),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 28),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "إضافة عقار جديد",
                        textAlign: TextAlign.right,
                        style:
                        Theme.of(context).textTheme.headlineLarge!.copyWith(
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

                    UploadImagesBox(
                      selectedImageBytes: selectedImageBytes,
                      onTap: pickImage,
                    ),

                    const SizedBox(height: 40),

                    const FieldTitle("عنوان الإعلان"),
                    CustomInput(
                      hint: "مثال: شقة مودرن في منطقة الرأس",
                      controller: titleController,
                      onTap: () => setState(() => activeStep = 1),
                    ),

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
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedType,
                          isExpanded: true,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xff6D7280),
                          ),
                          alignment: AlignmentDirectional.centerEnd,
                          items: propertyTypes.map((type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              alignment: Alignment.centerRight,
                              child: Text(type, textAlign: TextAlign.right),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value == null) return;
                            setState(() {
                              selectedType = value;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    const FieldTitle("السعر الشهري (شيكل)"),
                    CustomInput(
                      hint: "مثال: 1200",
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      onTap: () => setState(() => activeStep = 1),
                    ),

                    const SizedBox(height: 22),

                    const FieldTitle("عدد الغرف"),
                    CustomInput(
                      hint: "مثال: 3",
                      controller: bedroomsController,
                      keyboardType: TextInputType.number,
                      onTap: () => setState(() => activeStep = 1),
                    ),

                    const SizedBox(height: 22),

                    const FieldTitle("عدد الحمامات"),
                    CustomInput(
                      hint: "مثال: 2",
                      controller: bathroomsController,
                      keyboardType: TextInputType.number,
                      onTap: () => setState(() => activeStep = 1),
                    ),

                    const SizedBox(height: 22),

                    const FieldTitle("المساحة (م²)"),
                    CustomInput(
                      hint: "مثال: 120",
                      controller: areaController,
                      keyboardType: TextInputType.number,
                      onTap: () => setState(() => activeStep = 1),
                    ),

                    const SizedBox(height: 22),

                    const FieldTitle("موقف سيارات"),
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
                          Switch(
                            value: hasParking,
                            activeColor: TColors.PrimaryColor,
                            onChanged: (value) {
                              setState(() {
                                hasParking = value;
                              });
                            },
                          ),
                          const Spacer(),
                          Text(
                            hasParking ? "متوفر" : "غير متوفر",
                            style: const TextStyle(
                              color: Color(0xff303030),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    const FieldTitle("الموقع"),
                    CustomInput(
                      hint: "ابحث عن المدينة أو الحي",
                      icon: Icons.location_on_outlined,
                      controller: locationController,
                      onTap: () => setState(() => activeStep = 3),
                    ),

                    const SizedBox(height: 22),

                    const FieldTitle("رقم المعلن"),
                    CustomInput(
                      hint: "+970 59 000 0000",
                      controller: ownerPhoneController,
                      keyboardType: TextInputType.phone,
                      onTap: () => setState(() => activeStep = 3),
                    ),

                    const SizedBox(height: 22),

                    const FieldTitle("بريد المعلن"),
                    CustomInput(
                      hint: "owner@example.com",
                      controller: ownerEmailController,
                      keyboardType: TextInputType.emailAddress,
                      onTap: () => setState(() => activeStep = 3),
                    ),

                    const SizedBox(height: 22),

                    const FieldTitle("وصف العقار"),
                    Container(
                      height: 130,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xffE8E8E8),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextField(
                        controller: descriptionController,
                        maxLines: null,
                        expands: true,
                        textAlign: TextAlign.right,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          hintText:
                          "اكتب تفاصيل إضافية عن العقار والمميزات...",
                          border: InputBorder.none,
                          hintStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: const Color(0xff6B728080)
                                .withOpacity(0.50),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 65),

                    SizedBox(
                      height: 64,
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: isLoading ? null : submitProperty,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: TColors.PrimaryColor,
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                          color: TColors.PrimaryColor,
                        )
                            : const Text(
                          "إرسال الطلب للمراجعة",
                          style: TextStyle(
                            color: TColors.PrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Center(
                      child: Text(
                        "بضغطك على إرسال أنت توافق على شروط وأحكام RentEase",
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