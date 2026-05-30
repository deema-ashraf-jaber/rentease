import 'package:flutter/material.dart';
import '../../../../../../utils/constants/image_strings.dart';
import 'property_main_card.dart';

class PropertyImageHeader extends StatelessWidget {
  const PropertyImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          TImages.detailsHome,
          height: 330,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 10,
          right: 44,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4.5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.85),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              'متاح حالياً',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: const Color(0xff4A6FA5),
                fontSize: 12,
              ),
            ),
          ),
        ),
        const Positioned(
          right: 24,
          left: 24,
          bottom: -145,
          child: PropertyMainCard(),
        ),
      ],
    );
  }
}