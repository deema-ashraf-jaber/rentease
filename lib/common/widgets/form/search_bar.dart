import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';

class TSearchBar extends StatelessWidget {
  const TSearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          // زر الفلتر يمين
          Container(
            width: 54,
            height: 48,
            decoration: BoxDecoration(
              color: TColors.PrimaryColor,
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Icon(
              Iconsax.setting_4,
              color: Colors.white,
              size: 24,
            ),
          ),

          const SizedBox(width: 10),

          // مربع البحث
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.08),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  Expanded(
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: 'إبحث عن عقار...',
                        hintTextDirection: TextDirection.rtl,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        isCollapsed: true,
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(.35),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 14,),
                  const Icon(
                    Iconsax.search_normal_1,
                    color: Colors.grey,
                    size: 21,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}