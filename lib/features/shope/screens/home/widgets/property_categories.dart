

import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';

class PropertyCategories extends StatefulWidget {
  const PropertyCategories();

  @override
  State<PropertyCategories> createState() => _CategoriesState();
}

class _CategoriesState extends State<PropertyCategories> {
  int selectedIndex = 0;

  final List<String> cats = ['الكل', 'فيلات', 'شقق', 'حواصل'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        reverse: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 22, left: 22),
        itemCount: cats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 9),
        itemBuilder: (context, index) {
          final selected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 21),
              decoration: BoxDecoration(
                color: selected ? TColors.PrimaryColor : const Color(0xffE9EAEE),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Text(
                  cats[index],
                  style: TextStyle(
                    color: selected ? Colors.white : const Color(0xff222222),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}