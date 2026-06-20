import 'package:flutter/material.dart';
import 'favorite_property_model.dart';

class FavoriteManager {
  static final ValueNotifier<List<FavoriteProperty>> favorites =
  ValueNotifier<List<FavoriteProperty>>([]);

  static bool isFavorite(String title) {
    // TODO Supabase:
    // لاحقاً الأفضل يكون التحقق عن طريق propertyId بدل title
    // مثال: userId + propertyId من جدول favorites
    return favorites.value.any((property) => property.title == title);
  }

  static void toggleFavorite(FavoriteProperty property) {
    final currentFavorites = List<FavoriteProperty>.from(favorites.value);

    if (isFavorite(property.title)) {
      // TODO Supabase:
      // هنا لاحقاً بدل الحذف من الليست المحلية
      // نعمل delete من جدول favorites حسب userId و propertyId
      currentFavorites.removeWhere((item) => item.title == property.title);
    } else {
      // TODO Supabase:
      // هنا لاحقاً بدل الإضافة للّيست المحلية
      // نعمل insert في جدول favorites داخل Supabase
      currentFavorites.add(property);
    }

    favorites.value = currentFavorites;
  }

  static void removeFavorite(String title) {
    // TODO Supabase:
    // لاحقاً نعمل delete من جدول favorites حسب userId و propertyId
    final currentFavorites = List<FavoriteProperty>.from(favorites.value);
    currentFavorites.removeWhere((item) => item.title == title);
    favorites.value = currentFavorites;
  }
}