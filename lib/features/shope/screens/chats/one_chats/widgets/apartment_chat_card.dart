import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';

class ApartmentChatCard extends StatelessWidget {
  const ApartmentChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Card(
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          width: 304.3,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  TImages.apartment3,
                  height: 128,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'شقة مودرن - حي الرمال',
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: TColors.PrimaryColor,
                      ),
                    ),
                    Text(
                      '3 غرف نوم • 2 حمام',
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color(0xff434750),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: TColors.PrimaryColor,
                            foregroundColor: const Color(0xff8BA8E6),
                            minimumSize: const Size(76, 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'التفاصيل',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          ' 45,000 ر.س / سنوياً',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: TColors.PrimaryColor,
                            fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}