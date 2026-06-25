import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../property_details_screen/property_details_screen.dart';

class SmallPropertyCard extends StatelessWidget {
  const SmallPropertyCard({
    super.key,
    this.image = TImages.gradient,
    this.title = 'حاصل مجهز بالكامل',
    this.location = 'خانيونس، البلد',
    this.price = '٧٠٠',
    this.beds = 'لا يوجد',
    this.baths = 'لا يوجد',
    this.area = 'استوديو',
    this.ownerId = 'owner_3',
    this.propertyId = '',
    this.ownerName = 'شركة العقارات الحديثة',
    this.ownerPhone = '0597777777',
    this.description =
    'حاصل مجهز بالكامل ومناسب للاستخدام التجاري أو التخزين، يقع في موقع حيوي في خانيونس ويسهل الوصول إليه.',
  });

  final String image, title, location, price, beds, baths, area;
  final String ownerId, ownerName, ownerPhone, description , propertyId;

  ImageProvider get imageProvider {
    if (image.startsWith('http')) return NetworkImage(image);
    return AssetImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PropertyDetailsScreen(
              image: image,
              title: title,
              location: location,
              propertyId: propertyId,
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                      Expanded(
                        child: Text(
                          location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                          Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: const Color(0xff6B7280),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '$price ش.ج ',
                        style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: const Color(0xff4A6FA5),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 22),
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
              child: Image(
                image: imageProvider,
                width: 128,
                height: 128,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}