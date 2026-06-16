import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../property_details_screen/property_details_screen.dart';
import 'info_box.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.beds,
    required this.baths,
    required this.area,
    this.iconData = Icons.square_foot_outlined,
  });

  final String image, title, location, price, beds, baths, area;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(22, 0, 22, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PropertyDetailsScreen(),),);
            },
            child: Stack(
              children: [
                Container(
                  height: 225,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.25),
                        blurRadius: 18,
                        offset: const Offset(0, 9),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 14,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.20),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.red.shade400,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  right: 14,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.80),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'مميز',
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: const Color(0xff4A6FA5),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$price\nش.ج',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: TColors.PrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  height: 1.2,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: TColors.PrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        location,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            textDirection: TextDirection.ltr,
            children: [
              InfoBox(icon: Icons.bed_outlined, text: beds),
              const SizedBox(width: 10),
              InfoBox(icon: Icons.bathtub_outlined, text: baths),
              const SizedBox(width: 10),
              InfoBox(icon: iconData, text: area),
            ],
          ),
        ],
      ),
    );
  }
}