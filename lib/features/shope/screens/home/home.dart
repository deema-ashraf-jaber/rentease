import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rentease/common/widgets/appbar/appbar.dart';
import 'package:rentease/common/widgets/form/search_bar.dart';
import 'package:rentease/features/shope/screens/home/widgets/property_card.dart';
import 'package:rentease/features/shope/screens/home/widgets/property_categories.dart';
import 'package:rentease/features/shope/screens/home/widgets/small_property_card.dart';
import 'package:rentease/utils/constants/image_strings.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const TAppBar(
          title: TTexts.rentEase,
          actionIcon: Icons.person_2_outlined,
        ),
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: TColors.PrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              const SizedBox(height: 8),
              const TSearchBar(),
              const SizedBox(height: 18),
              const PropertyCategories(),
              const SizedBox(height: 22),
              PropertyCard(
                image: TImages.apartment1,
                title: 'شقة عصرية في وسط\nالمدينة',
                location: 'غزة، حي الرمال',
                price: '١٥٠٠',
                beds: '٣',
                baths: '٢',
                area: '١٢٠م²',
              ),
              PropertyCard(
                image: TImages.apartment2,
                title: 'فيلا سكنية واسعة للمؤسسات',
                location: 'غزة، الجلاء',
                price: '5,000',
                beds: '5',
                baths: '4',
                area: 'متوفر',
                iconData: Icons.pool,
              ),
              const SmallPropertyCard(),
            ],
          ),
        ),
      ),
    );
  }
}