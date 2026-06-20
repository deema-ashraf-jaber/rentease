import 'package:flutter/material.dart';

import 'widgets/bottom_contact_bar.dart';
import 'widgets/details_app_bar.dart';
import 'widgets/features_grid.dart';
import 'widgets/location_section.dart';
import 'widgets/property_details_section.dart';
import 'widgets/property_image_header.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({
    super.key,
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
  });

  final String image;
  final String title;
  final String location;
  final String price;
  final String beds;
  final String baths;
  final String area;
  final String description;
  final String ownerId;
  final String ownerName;
  final String ownerPhone;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomContactBar(
          ownerId: ownerId, ownerName: ownerName, ownerPhone:ownerPhone, propertyTitle: title,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const DetailsAppBar(),
                PropertyImageHeader(
                  image: image,
                  title: title,
                  location: location,
                  price: price,
                ),
                const SizedBox(height: 175),
                FeaturesGrid(
                  beds: beds,
                  baths: baths,
                  area: area,
                ),
                const SizedBox(height: 48),
                PropertyDetailsSection(
                  title: title,
                  location: location,
                  price: price,
                  description: description,
                ),
                const SizedBox(height: 42),
                const LocationSection(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}