
import 'package:flutter/material.dart';
import 'package:rentease/common/widgets/appbar/appbar.dart';
import 'package:rentease/common/widgets/form/search_bar.dart';
import 'package:rentease/features/shope/screens/home/widgets/property_card.dart';
import 'package:rentease/features/shope/screens/home/widgets/property_categories.dart';
import 'package:rentease/features/shope/screens/home/widgets/small_property_card.dart';
import 'package:rentease/utils/constants/image_strings.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,this.onAddPressed ,this.onProfilePressed});
final VoidCallback? onAddPressed;
  final VoidCallback? onProfilePressed;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class PropertyItem {
  final String image, title, location, price, beds, baths, area, description;
  final String ownerId, ownerName, ownerPhone;
  final IconData iconData;

  PropertyItem({
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.beds,
    required this.baths,
    required this.area,
    required this.description,
    required this.ownerId,
    required this.ownerName,
    required this.ownerPhone,
    this.iconData = Icons.square_foot_outlined,
  });
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = '';
  String selectedCategory = 'الكل';

  final List<PropertyItem> properties = [
    PropertyItem(
      image: TImages.apartment1,
      title: 'شقة عصرية في وسط\nالمدينة',
      location: 'غزة، حي الرمال',
      price: '١٥٠٠',
      beds: '٣',
      baths: '٢',
      area: '١٢٠م²',
      ownerId: 'owner_1',
      ownerName: 'أحمد العقاد',
      ownerPhone: '0599999999',

      description:
      'شقة عصرية مجهزة بتصميم مريح ومناسب للعائلات، تقع في وسط المدينة بالقرب من الأسواق والخدمات الأساسية. تتميز بإضاءة طبيعية جيدة ومساحة عملية تجعل السكن فيها مريحاً وسهل الوصول.',
    ),
    PropertyItem(
      image: TImages.apartment2,
      title: 'فيلا سكنية واسعة للمؤسسات',
      location: 'غزة، الجلاء',
      price: '5,000',
      beds: '5',
      baths: '4',
      area: 'متوفر',
      iconData: Icons.pool,
      description:
      'فيلا سكنية واسعة بتصميم أنيق ومساحات كبيرة، مناسبة للعائلات الكبيرة أو المؤسسات. تحتوي على عدد جيد من الغرف والحمامات، وتوفر خصوصية وراحة مع موقع قريب من الخدمات الرئيسية.',
      ownerId: 'owner_2',
        ownerName: 'منى محمود',
        ownerPhone: '0598888888',
    ),
  ];
  bool get showSmallPropertyCard {
    final query = searchText.trim();

    // إذا اختار شقق أو فيلات لا تعرض الحاصل
    if (selectedCategory == 'شقق') return false;
    if (selectedCategory == 'فيلات') return false;

    // إذا اختار حواصل اعرض الحاصل دائماً
    if (selectedCategory == 'حواصل') return true;

    // إذا اختار الكل
    if (query.isEmpty) return true;

    return 'حاصل مجهز بالكامل'.contains(query) ||
        'استوديو'.contains(query) ||
        'خانيونس، البلد'.contains(query) ||
        '٧٠٠'.contains(query);
  }
  @override
  Widget build(BuildContext context) {
    final filteredProperties = properties.where((property) {
      final query = searchText.trim();

      bool matchesSearch = query.isEmpty ||
          property.title.contains(query) ||
          property.location.contains(query) ||
          property.price.contains(query) ||
          property.area.contains(query) ||
          property.description.contains(query);

      bool matchesCategory = true;

      if (selectedCategory == 'شقق') {
        matchesCategory = property.title.contains('شقة');
      }

      else if (selectedCategory == 'فيلات') {
        matchesCategory = property.title.contains('فيلا');
      }
      else if (selectedCategory == 'حواصل') {
        matchesCategory = false;
      }

      return matchesSearch && matchesCategory;
    }).toList();

    final hasResults = filteredProperties.isNotEmpty || showSmallPropertyCard;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: TTexts.rentEase,
          actionIcon: Icons.person_2_outlined,
          isBack: false,
          onActionPressed:(){
            widget.onProfilePressed?.call();
            },
        ),
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: TColors.PrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onPressed: () {
            if(widget.onAddPressed != null){
              widget.onAddPressed!();
            }
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              const SizedBox(height: 8),
              TSearchBar(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
              const SizedBox(height: 18),
              PropertyCategories(
                onCategoryChanged: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              const SizedBox(height: 22),
              if (!hasResults)
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'لا توجد نتائج مطابقة',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                )
              else ...[
                ...filteredProperties.map(
                      (property) => PropertyCard(
                    image: property.image,
                    title: property.title,
                    location: property.location,
                    price: property.price,
                    beds: property.beds,
                    baths: property.baths,
                    area: property.area,
                    iconData: property.iconData,
                    description: property.description,
                    ownerId: property.ownerId,
                    ownerName: property.ownerName,
                    ownerPhone: property.ownerPhone,

                  ),
                ),
                if (showSmallPropertyCard) const SmallPropertyCard(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}