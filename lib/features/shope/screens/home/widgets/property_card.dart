import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../favorites/models/favorite_manager.dart';
import '../../favorites/models/favorite_property_model.dart';
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
    required this.description,
    required this.ownerId,
    required this.ownerName,
    required this.ownerPhone,
    required this.propertyId,
  this.iconData = Icons.square_foot_outlined,
  });

  final String image, title, location, price, beds, baths, area, description;
  final String ownerId, ownerName, ownerPhone , propertyId;
  final IconData iconData;

  ImageProvider get imageProvider {
    if (image.startsWith('http')) {
      return NetworkImage(image);
    }
    return AssetImage(image);
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProperty = FavoriteProperty(
      image: image,
      title: title,
      propertyId: propertyId,
      ownerId: ownerId,
      ownerName: ownerName,
      ownerPhone: ownerPhone,
      location: location,
      price: price,
      rooms: beds,
      bathrooms: baths,
      area: area,
      description: description,
    );

    return Container(
      margin: const EdgeInsets.fromLTRB(22, 0, 22, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PropertyDetailsScreen(
                    image: image,
                    propertyId: propertyId,
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
            child: Stack(
              children: [
                Container(
                  height: 225,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    image: DecorationImage(
                      image: imageProvider,
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
                  child: ValueListenableBuilder(
                    valueListenable: FavoriteManager.favorites,
                    builder: (context, favorites, _) {
                      final isFav = FavoriteManager.isFavorite(propertyId);
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () async {
                          await FavoriteManager.toggleFavorite(favoriteProperty);
                        },
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
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red.shade400,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.80),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'مميز',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
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
                      Text(location, style: const TextStyle(color: Colors.grey)),
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