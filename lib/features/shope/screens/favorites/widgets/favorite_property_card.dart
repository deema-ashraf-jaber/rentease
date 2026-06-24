import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../home/property_details_screen/property_details_screen.dart';
import '../models/favorite_manager.dart';
import '../models/favorite_property_model.dart';

class FavoritePropertyCard extends StatelessWidget {
  final FavoriteProperty property;

  const FavoritePropertyCard({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PropertyDetailsScreen(
              propertyId: property.propertyId,
              image: property.image,
              title: property.title,
              location: property.location,
              price: property.price,
              beds: property.rooms,
              baths: property.bathrooms,
              area: property.area,
              description: property.description,
              ownerId: property.ownerId,
              ownerName: property.ownerName,
              ownerPhone: property.ownerPhone,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image(
                    image: property.image.startsWith('http')
                        ? NetworkImage(property.image)
                        : AssetImage(property.image) as ImageProvider,
                    height: 190,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () async{
                      await FavoriteManager.removeFavorite(property.propertyId);
                    },
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 22,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: TColors.PrimaryColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      '${property.price} / شهر',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(14, 16, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    property.title,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        property.location,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${property.area} م²'),
                      const SizedBox(width: 18),
                      Text('${property.bathrooms} حمام'),
                      const SizedBox(width: 18),
                      Text('${property.rooms} غرف'),
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