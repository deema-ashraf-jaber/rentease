import 'package:flutter/material.dart';
import '../models/favorite_property_model.dart';

class FavoritePropertyCard extends StatelessWidget {
  final FavoriteProperty property;

  const FavoritePropertyCard({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      child: Column(
        children: [

          Stack(
            children: [

              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.asset(
                  property.image,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    property.price,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Text(
                  property.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),

                const SizedBox(height: 5),

                Text(
                  property.location,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.right,
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [

                    Text(property.area),

                    Text(property.bathrooms),

                    Text(property.rooms),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}