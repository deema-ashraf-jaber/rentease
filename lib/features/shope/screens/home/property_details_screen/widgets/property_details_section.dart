import 'package:flutter/material.dart';
import 'section_title.dart';

class PropertyDetailsSection extends StatelessWidget {
  const PropertyDetailsSection({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.description,
  });

  final String title;
  final String location;
  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: SectionTitle(title: 'تفاصيل العقار'),
        ),
        const SizedBox(height: 24),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.only(
            left: 50,
            top: 32,
            right: 32,
            bottom: 32,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffF3F3F3).withOpacity(0.50),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            description,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: const Color(0xff6B7280),
              height: 1.6,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}