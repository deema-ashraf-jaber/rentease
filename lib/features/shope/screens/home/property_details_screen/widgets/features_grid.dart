import 'package:flutter/material.dart';
import 'feature_box.dart';

class FeaturesGrid extends StatelessWidget {
  const FeaturesGrid({
    super.key,
    required this.beds,
    required this.baths,
    required this.area,
  });

  final String beds;
  final String baths;
  final String area;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 22,
        crossAxisSpacing: 16,
        childAspectRatio: 1.55,
        children: [
          FeatureBox(icon: Icons.bed_outlined, title: beds),
          FeatureBox(icon: Icons.bathtub_outlined, title: baths),
          FeatureBox(icon: Icons.square_foot_outlined, title: area),
          const FeatureBox(icon: Icons.garage_outlined, title: 'موقف سيارة'),
        ],
      ),
    );
  }
}