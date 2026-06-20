import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../property_details_screen/property_details_screen.dart';

class SmallPropertyCard extends StatelessWidget {
  const SmallPropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    const image = TImages.gradient;
    const title = 'حاصل مجهز بالكامل';
    const location = 'خانيونس، البلد';
    const price = '٧٠٠';
    const beds = 'لا يوجد';
    const baths = 'لا يوجد';
    const area = 'استوديو';
    const ownerId = 'owner_3';
    const ownerName = 'شركة العقارات الحديثة';
    const ownerPhone = '0597777777';
    const description =
        'حاصل مجهز بالكامل ومناسب للاستخدام التجاري أو التخزين، يقع في موقع حيوي في خانيونس ويسهل الوصول إليه. يتميز بمساحة عملية وتجهيزات مناسبة للاستخدام اليومي مع توفر الخدمات الأساسية بالقرب منه.';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PropertyDetailsScreen(
              image: image,
              title: title,
              location: location,
              price: price,
              beds: beds,
              baths: baths,
              area: area,
              description: description,
              ownerId: ownerId,
              ownerName: ownerName,
              ownerPhone: ownerPhone,
            ),
          ),
        );
      },
      child: Container(
        height: 152,
        margin: const EdgeInsets.fromLTRB(22, 0, 22, 20),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.13),
              blurRadius: 22,
              offset: const Offset(0, 9),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    area,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: const Color(0xff6B7280),
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: TColors.PrimaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    textDirection: TextDirection.ltr,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: Color(0xff6B7280),
                      ),
                      Text(
                        location,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: const Color(0xff6B7280),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '$price ش.إ ',
                        style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: const Color(0xff4A6FA5),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 32.4),
                      Text(
                        "شهرياً",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: const Color(0xff6B7280),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 128,
                height: 128,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}