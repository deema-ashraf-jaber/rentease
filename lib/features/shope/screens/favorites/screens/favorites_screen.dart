import 'package:flutter/material.dart';
import 'package:rentease/common/widgets/appbar/appbar.dart';
import 'package:rentease/features/shope/screens/notifications/notifications.dart';

import '../../../../../utils/constants/colors.dart';
import '../models/favorite_manager.dart';
import '../widgets/favorite_property_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    FavoriteManager.loadFavorites();
  }
  bool sortLowToHigh = true;

  int _priceNumber(String price) {
    return int.tryParse(price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.backgroundColor,
      appBar:TAppBar(title: "المفضلة" , isBack: false,actionIcon:Icons.notifications_none ,onActionPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const NotificationsScreen(),
          ),
        );
      },),
      // AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   elevation: 0,
      //   title: const Text(
      //     'المفضلة',
      //     style: TextStyle(
      //       color: TColors.PrimaryColor,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   leading: const Icon(Icons.arrow_back, color: TColors.PrimaryColor),
      //   actions: const [
      //     Padding(
      //       padding: EdgeInsets.only(right: 16),
      //       child: Icon(Icons.notifications_none, color: TColors.PrimaryColor),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ValueListenableBuilder(
          valueListenable: FavoriteManager.favorites,
          builder: (context, favorites, _) {
            final sortedFavorites = [...favorites];

            sortedFavorites.sort((a, b) {
              final aPrice = _priceNumber(a.price);
              final bPrice = _priceNumber(b.price);

              return sortLowToHigh
                  ? aPrice.compareTo(bPrice)
                  : bPrice.compareTo(aPrice);
            });

            return Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'قائمة رغباتك',
                        style: TextStyle(
                          color: TColors.PrimaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'لديك ${favorites.length} عقارات محفوظة حالياً',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        sortLowToHigh = !sortLowToHigh;
                      });
                    },
                    icon: const Icon(
                      Icons.sort,
                      size: 18,
                      color: TColors.PrimaryColor,
                    ),
                    label: Text(
                      sortLowToHigh
                          ? 'ترتيب: الأقل سعراً'
                          : 'ترتيب: الأعلى سعراً',
                      style: const TextStyle(
                        color: TColors.PrimaryColor,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: sortedFavorites.isEmpty
                      ? const Center(
                    child: Text(
                      'لا توجد عقارات في المفضلة',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  )
                      : ListView.builder(
                    itemCount: sortedFavorites.length,
                    itemBuilder: (context, index) {
                      return FavoritePropertyCard(
                        property: sortedFavorites[index],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}