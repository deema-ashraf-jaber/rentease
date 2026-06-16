import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';

class NotificationCard extends StatelessWidget {
  final String time;
  final String title;
  final String body;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final bool showSideLine;
  final bool isToday;

  const NotificationCard({
    super.key,
    required this.time,
    required this.title,
    required this.body,
    required this.icon,
    this.iconColor = const Color(0xFF64748B),
    this.iconBg = const Color(0xFFF0F4F8),
    this.showSideLine = false,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: TColors.PrimaryColor.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            if (showSideLine)
              Container(
                width: 4,
                color: TColors.PrimaryColor,
              ),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: iconBg,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        color: iconColor,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                title,
                                textAlign: TextAlign.right,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: isToday
                                      ? TColors.PrimaryColor
                                      : const Color(0xff434750),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                time,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                  color: isToday
                                      ? const Color(0xff94A3B8)
                                      : const Color(0xff64748B),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            body,
                            style:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: const Color(0xff434750),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}