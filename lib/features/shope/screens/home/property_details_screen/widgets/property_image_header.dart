import 'package:flutter/material.dart';
import 'property_main_card.dart';

class PropertyImageHeader extends StatelessWidget {
  const PropertyImageHeader({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
  });

  final String image;
  final String title;
  final String location;
  final String price;

  ImageProvider get imageProvider {
    if (image.startsWith('http')) {
      return NetworkImage(image);
    }
    return AssetImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image(
          image: imageProvider,
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
        Positioned(
          right: 24,
          left: 24,
          bottom: -145,
          child: PropertyMainCard(
            title: title,
            location: location,
            price: price,
          ),
        ),
      ],
    );
  }
}