import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../favorites/models/favorite_manager.dart';
import '../../favorites/models/favorite_property_model.dart';
import '../../home/property_details_screen/property_details_screen.dart';
import '../models/search_property_model.dart';

class PropertyCard extends StatelessWidget {
  final SearchPropertyModel property;

  const PropertyCard({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteProperty = FavoriteProperty(
      propertyId: property.id,
      ownerId: property.ownerId,
      ownerName: property.ownerName,
      ownerPhone: property.ownerPhone,
      image: property.image,
      title: property.title,
      location: property.location,
      price: property.price,
      rooms: property.rooms,
      bathrooms: property.baths,
      area: property.size,
      description: property.description,
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PropertyDetailsScreen(
              propertyId: property.id,
              image: property.image,
              title: property.title,
              location: property.location,
              price: property.price,
              beds: property.rooms,
              baths: property.baths,
              area: property.size,
              description: property.description,
              ownerId: property.ownerId,
              ownerName: property.ownerName,
              ownerPhone: property.ownerPhone,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.07),
              blurRadius: 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(22)),
                  child: Image(
                    image: property.image.startsWith('http')
                        ? NetworkImage(property.image)
                        : AssetImage(property.image) as ImageProvider,
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 16,
                  left: 16,
                  child: ValueListenableBuilder(
                    valueListenable: FavoriteManager.favorites,
                    builder: (context, favorites, _) {
                      final isFav = FavoriteManager.isFavorite(property.id);

                      return GestureDetector(
                        onTap: () async {
                          await FavoriteManager.toggleFavorite(favoriteProperty);
                        },
                        child: CircleAvatar(
                          radius: 21,
                          backgroundColor: Colors.white.withOpacity(.65),
                          child: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : Colors.white,
                            size: 26,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.95),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Text(
                          property.rating,
                          style: const TextStyle(
                            color: TColors.PrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star,
                          color: TColors.PrimaryColor,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: TColors.PrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                      ),
                    ),
                    child: Text(
                      property.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffEAF1FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          property.status,
                          style: const TextStyle(
                            color: TColors.PrimaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 3,
                        child: Text(
                          property.title,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff222222),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        property.location,
                        style: const TextStyle(
                          color: Color(0xff7E8082),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: Color(0xff7E8082),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  const Divider(color: Color(0xffE3E2E7)),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(property.size),
                      Text(property.baths),
                      Text(property.rooms),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}