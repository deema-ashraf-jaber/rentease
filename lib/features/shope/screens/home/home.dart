import 'package:flutter/material.dart';
import 'package:rentease/common/widgets/appbar/appbar.dart';
import 'package:rentease/common/widgets/form/search_bar.dart';
import 'package:rentease/features/shope/screens/home/widgets/property_card.dart';
import 'package:rentease/features/shope/screens/home/widgets/property_categories.dart';
import 'package:rentease/features/shope/screens/home/widgets/small_property_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.onAddPressed,
    this.onProfilePressed,
  });

  final VoidCallback? onAddPressed;
  final VoidCallback? onProfilePressed;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class PropertyItem {
  final String image, title, location, price, beds, baths, area, description;
  final String ownerId, ownerName, ownerPhone;
  final IconData iconData;
  final String propertyType;

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
    required this.propertyType,
    this.iconData = Icons.square_foot_outlined,
  });

  factory PropertyItem.fromMap(Map<String, dynamic> map) {
    return PropertyItem(
      image: (map['image_url'] ?? '').toString(),
      title: (map['title'] ?? '').toString(),
      location: (map['location'] ?? '').toString(),
      price: (map['monthly_price'] ?? '').toString(),
      beds: (map['bedrooms'] ?? '').toString(),
      baths: (map['bathrooms'] ?? '').toString(),
      area: '${map['area'] ?? ''}م²',
      description: (map['description'] ?? '').toString(),
      ownerId: (map['owner_id'] ?? '').toString(),
      ownerName: (map['owner_email'] ?? 'معلن العقار').toString(),
      ownerPhone: (map['owner_phone'] ?? '').toString(),
      propertyType: (map['property_type'] ?? '').toString(),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = '';
  String selectedCategory = 'الكل';

  bool isLoading = true;
  List<PropertyItem> properties = [];

  @override
  void initState() {
    super.initState();
    fetchProperties();
  }

  Future<void> fetchProperties() async {
    try {
      final response = await Supabase.instance.client
          .from('properties')
          .select()
          .order('created_at', ascending: false);

      final items = (response as List)
          .map((item) => PropertyItem.fromMap(item as Map<String, dynamic>))
          .toList();

      if (!mounted) return;

      setState(() {
        properties = items;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'حدث خطأ أثناء تحميل العقارات: $e',
            textAlign: TextAlign.right,
          ),
          backgroundColor: TColors.PrimaryColor,
        ),
      );
    }
  }

  bool isSmallType(PropertyItem property) {
    return property.propertyType == 'حاصل' ||
        property.propertyType == 'استوديو' ||
        property.propertyType == 'غرفة';
  }

  bool matchesSearch(PropertyItem property) {
    final query = searchText.trim();

    return query.isEmpty ||
        property.title.contains(query) ||
        property.location.contains(query) ||
        property.price.contains(query) ||
        property.area.contains(query) ||
        property.description.contains(query) ||
        property.propertyType.contains(query);
  }

  @override
  Widget build(BuildContext context) {
    final searchedProperties = properties.where(matchesSearch).toList();

    final bigProperties = searchedProperties.where((property) {
      if (isSmallType(property)) return false;

      if (selectedCategory == 'شقق') {
        return property.propertyType == 'شقة';
      }

      if (selectedCategory == 'فيلات') {
        return property.propertyType == 'فيلا';
      }

      if (selectedCategory == 'حواصل') {
        return false;
      }

      return true;
    }).toList();

    final smallProperties = searchedProperties.where((property) {
      if (!isSmallType(property)) return false;

      if (selectedCategory == 'شقق') return false;
      if (selectedCategory == 'فيلات') return false;

      return true;
    }).toList();

    final hasResults = bigProperties.isNotEmpty || smallProperties.isNotEmpty;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: TTexts.rentEase,
          actionIcon: Icons.person_2_outlined,
          isBack: false,
          onActionPressed: () {
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
            widget.onAddPressed?.call();
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: RefreshIndicator(
          onRefresh: fetchProperties,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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

                if (isLoading)
                  const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: CircularProgressIndicator(
                      color: TColors.PrimaryColor,
                    ),
                  )
                else if (!hasResults)
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
                    ...bigProperties.map(
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

                    ...smallProperties.map(
                          (property) => SmallPropertyCard(
                        image: property.image,
                        title: property.title,
                        location: property.location,
                        price: property.price,
                        beds: property.beds,
                        baths: property.baths,
                        area: property.propertyType,
                        description: property.description,
                        ownerId: property.ownerId,
                        ownerName: property.ownerName,
                        ownerPhone: property.ownerPhone,
                      ),
                    ),
                  ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}