import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'favorite_property_model.dart';

class FavoriteManager {
  static final ValueNotifier<List<FavoriteProperty>> favorites =
  ValueNotifier<List<FavoriteProperty>>([]);

  static bool isFavorite(String propertyId) {
    return favorites.value.any((property) => property.propertyId == propertyId);
  }

  static Future<void> loadFavorites() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    final response = await Supabase.instance.client
        .from('favorites')
        .select('properties(*)')
        .eq('user_id', user.id);

    final loaded = (response as List).map((item) {
      final map = item['properties'] as Map<String, dynamic>;

      return FavoriteProperty(
        propertyId: (map['id'] ?? '').toString(),
        image: (map['image_url'] ?? '').toString(),
        title: (map['title'] ?? '').toString(),
        location: (map['location'] ?? '').toString(),
        price: (map['monthly_price'] ?? '').toString(),
        rooms: (map['bedrooms'] ?? '').toString(),
        bathrooms: (map['bathrooms'] ?? '').toString(),
        area: '${map['area'] ?? ''}م²',
        description: (map['description'] ?? '').toString(),
        ownerId: (map['owner_id'] ?? '').toString(),
        ownerName: (map['owner_email'] ?? 'معلن العقار').toString(),
        ownerPhone: (map['owner_phone'] ?? '').toString(),
      );
    }).toList();

    favorites.value = loaded;
  }

  static Future<void> toggleFavorite(FavoriteProperty property) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    final currentFavorites = List<FavoriteProperty>.from(favorites.value);

    if (isFavorite(property.propertyId)) {
      await Supabase.instance.client
          .from('favorites')
          .delete()
          .eq('user_id', user.id)
          .eq('property_id', property.propertyId);

      currentFavorites.removeWhere(
            (item) => item.propertyId == property.propertyId,
      );
    } else {
      await Supabase.instance.client.from('favorites').insert({
        'user_id': user.id,
        'property_id': property.propertyId,
      });

      currentFavorites.add(property);
    }

    favorites.value = currentFavorites;
  }

  static Future<void> removeFavorite(String propertyId) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    await Supabase.instance.client
        .from('favorites')
        .delete()
        .eq('user_id', user.id)
        .eq('property_id', propertyId);

    final currentFavorites = List<FavoriteProperty>.from(favorites.value);
    currentFavorites.removeWhere((item) => item.propertyId == propertyId);
    favorites.value = currentFavorites;
  }
}