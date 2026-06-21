import 'package:flutter/material.dart';
import 'package:rentease/features/shope/screens/notifications/notifications.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../bottom_navigation.dart';
import '../../../../utils/constants/colors.dart';
import 'models/search_property_model.dart';
import 'widgets/property_card.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();

  String selectedCity = 'الكل';
  bool newestFirst = true;
  bool isLoading = true;

  List<SearchPropertyModel> properties = [];

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

      final items = (response as List).map((item) {
        final map = item as Map<String, dynamic>;

        return SearchPropertyModel(
          image: (map['image_url'] ?? '').toString(),
          title: (map['title'] ?? '').toString(),
          location: (map['location'] ?? '').toString(),
          price: '${map['monthly_price'] ?? ''} ش.ج / شهر',
          rooms: '${map['bedrooms'] ?? ''} غرف',
          baths: '${map['bathrooms'] ?? ''} حمام',
          size: '${map['area'] ?? ''}م²',
          rating: '4.8',
          status: (map['status'] ?? 'متاح الآن').toString(),
          createdAt: DateTime.tryParse(
            (map['created_at'] ?? '').toString(),
          ) ??
              DateTime.now(),
          description: (map['description'] ?? '').toString(),
        );
      }).toList();

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

  List<SearchPropertyModel> get filteredProperties {
    final query = searchController.text.trim();

    List<SearchPropertyModel> result = properties.where((property) {
      final matchesSearch = query.isEmpty ||
          property.title.contains(query) ||
          property.location.contains(query) ||
          property.price.contains(query) ||
          property.description.contains(query);

      final matchesFilter = selectedCity == 'الكل' ||
          property.title.contains(selectedCity) ||
          property.location.contains(selectedCity);

      return matchesSearch && matchesFilter;
    }).toList();

    result.sort((a, b) {
      return newestFirst
          ? b.createdAt.compareTo(a.createdAt)
          : a.createdAt.compareTo(b.createdAt);
    });

    return result;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Widget buildFilterChip(String title) {
    final isSelected = selectedCity == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCity = title;
        });
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
          color: isSelected ? TColors.PrimaryColor : const Color(0xffEEF0F5),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: const Color(0xffE3E2E7),
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: TColors.PrimaryColor.withOpacity(.25),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ]
              : [],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xff434750),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shownProperties = filteredProperties;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: TColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          leading: Container(),
          title: const Text(
            'RentEase',
            style: TextStyle(
              color: TColors.PrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.notifications_none,
                  color: TColors.PrimaryColor,
                ),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: fetchProperties,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xffD8DCE5)),
                    ),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: searchController,
                      textAlign: TextAlign.right,
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(
                        hintText: 'ابحث عن عقارك بغزة...',
                        hintStyle: const TextStyle(color: Color(0xff8A8D93)),
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xff94A3B8),
                          size: 28,
                        ),
                        suffixIcon: Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: TColors.PrimaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                SizedBox(
                  height: 42,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    children: [
                      buildFilterChip('الكل'),
                      const SizedBox(width: 10),
                      buildFilterChip('مدينة غزة'),
                      const SizedBox(width: 10),
                      buildFilterChip('الرمال'),
                      const SizedBox(width: 10),
                      buildFilterChip('النصر'),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          newestFirst = !newestFirst;
                        });
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.sort,
                            color: TColors.PrimaryColor,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            newestFirst ? 'الأحدث' : 'الأقدم',
                            style: const TextStyle(
                              color: TColors.PrimaryColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'نتائج البحث',
                      style:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff222222),
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '(${shownProperties.length} عقار)',
                      style: const TextStyle(
                        color: Color(0xff8A8D93),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: isLoading
                      ? const Center(
                    child: CircularProgressIndicator(
                      color: TColors.PrimaryColor,
                    ),
                  )
                      : shownProperties.isEmpty
                      ? ListView(
                    children: const [
                      SizedBox(height: 120),
                      Center(
                        child: Text(
                          'لا توجد نتائج مطابقة',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                      : ListView.builder(
                    itemCount: shownProperties.length + 1,
                    itemBuilder: (context, index) {
                      if (index == shownProperties.length) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: TColors.PrimaryColor,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'هل تملك عقاراً؟',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'اعرض عقارك بسهولة للوصول للمستأجرين المحتملين',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 15),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const BottomNavigationScreen(
                                        initialIndex: 2,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text('إضافة عقار'),
                              ),
                            ],
                          ),
                        );
                      }

                      final property = shownProperties[index];

                      return PropertyCard(
                        property: property,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}