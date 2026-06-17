import 'package:flutter/material.dart';

import '../models/favorite_property_model.dart';
import '../widgets/favorite_property_card.dart';
import '../widgets/bottom_nav_bar.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final List<FavoriteProperty> favorites = [

    FavoriteProperty(
      image: 'assets/images/properties/apartment1.jpg',
      title: 'شقة فاخرة في حي الرمال',
      location: 'غزة - حي الرمال الشمالي',
      price: '\$1200 / شهر',
      rooms: '3 غرف',
      bathrooms: '2 حمام',
      area: '145 م²',
    ),

    FavoriteProperty(
      image: 'assets/images/properties/apartment2.jpg',
      title: 'مجمع عصري في تل الهوى',
      location: 'غزة - تل الهوى',
      price: '\$950 / شهر',
      rooms: '4 غرف',
      bathrooms: '3 حمام',
      area: '180 م²',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'المفضلة',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'قائمة رغباتك',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return FavoritePropertyCard(
                    property: favorites[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),


    );
  }
}