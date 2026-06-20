import 'dart:typed_data';
import 'package:flutter/material.dart';

class ProfileImageManager {
  static final ValueNotifier<Uint8List?> profileImageBytes =
  ValueNotifier<Uint8List?>(null);

  static String? imageName;

  static void updateImage({
    required Uint8List bytes,
    required String name,
  }) {
    profileImageBytes.value = bytes;
    imageName = name;
  }

  static void clearImage() {
    profileImageBytes.value = null;
    imageName = null;
  }
}