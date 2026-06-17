import 'package:flutter/material.dart';
import 'feature_box.dart';

class FeaturesGrid extends StatelessWidget {
  const FeaturesGrid({super.key});

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
        children: const [
          FeatureBox(icon: Icons.bed_outlined, title: '٤ غرف نوم'),
          FeatureBox(icon: Icons.bathtub_outlined, title: '٣ دورات مياه'),
          FeatureBox(icon: Icons.square_foot_outlined, title: '٣٥٠ متر مربع'),
          FeatureBox(icon: Icons.garage_outlined, title: 'موقف سيارة'),
        ],
      ),
    );
  }
}