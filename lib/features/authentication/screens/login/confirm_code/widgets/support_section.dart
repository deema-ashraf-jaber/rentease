import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../utils/constants/colors.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});
  Future<void> _callSupport() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '0599999999');

    if (!await launchUrl(phoneUri)) {
      throw Exception('Could not launch phone');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: 0.20,
          child: Container(
            width: 293,
            height: 1,
            color: TColors.SecondaryColor,
          ),
        ),

        const SizedBox(height: 32),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'تحتاج مساعدة؟',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: TColors.PrimaryColor,
                  ),
                ),
                InkWell(
                  onTap: () => _callSupport(),
                  child: Text(
                    'تواصل مع الدعم الفني',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xff474747),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 24),

            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.support_agent,
                color: TColors.PrimaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}