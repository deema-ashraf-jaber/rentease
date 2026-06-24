import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class UploadImagesBox extends StatelessWidget {
  final Uint8List? selectedImageBytes;
  final VoidCallback onTap;

  const UploadImagesBox({
    super.key,
    required this.selectedImageBytes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          color: const Color(0xffC6C6C6),
          strokeWidth: 2,
          dashPattern: const [6, 4],
          radius: const Radius.circular(8),
        ),
        child: Container(
          width: double.infinity,
          height: 182,
          decoration: BoxDecoration(
            color: const Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: selectedImageBytes != null
              ? ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.memory(
              selectedImageBytes!,
              width: double.infinity,
              height: 182,
              fit: BoxFit.cover,
            ),
          )
              : Center(
            child: Stack(
              children: [
                Center(
                  child: Opacity(
                    opacity: 0.08,
                    child: Image.asset(
                      TImages.uploadProperty,
                      color: Colors.grey,
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_a_photo_outlined,
                        color: Color(0xff777777),
                        size: 32,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "تحميل صور العقار",
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: TColors.PrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "يمكنك رفع حتى ١٠ صور عالية الجودة",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: const Color(0xff6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}