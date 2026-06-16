import 'package:flutter/material.dart';
import 'package:rentease/utils/constants/image_strings.dart';

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 192,
            height: 192,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF1B3C73).withOpacity(0.20),
                  const Color(0xFF1B3C73).withOpacity(0.00),
                ],
              ),
            ),
            child:  Opacity(
              opacity: 0.40,
              child: Image(
                image: AssetImage(TImages.noNotification),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'لا يوجد تنبيهات قديمة أخرى',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: const Color(0xff94A3B8),
            ),
          ),
        ],
      ),
    );
  }
}