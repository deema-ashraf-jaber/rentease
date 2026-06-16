import 'package:flutter/material.dart';

import 'widgets/bottom_contact_bar.dart';
import 'widgets/details_app_bar.dart';
import 'widgets/features_grid.dart';
import 'widgets/location_section.dart';
import 'widgets/property_details_section.dart';
import 'widgets/property_image_header.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomContactBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DetailsAppBar(),
                PropertyImageHeader(),
                SizedBox(height: 175),
                FeaturesGrid(),
                SizedBox(height: 48),
                PropertyDetailsSection(),
                SizedBox(height: 42),
                LocationSection(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}