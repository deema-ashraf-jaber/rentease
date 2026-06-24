import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final int? badgeCount;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    this.trailing,
    this.badgeCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      leading: trailing ??
          SizedBox(
            width: 40,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                const Icon(Icons.arrow_back_ios_new, size: 16, color: Color(0xff747781)),
                if (badgeCount != null && badgeCount! > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      width: 23.5,
                      height: 19,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xffBA1A1A),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        badgeCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
      title: Text(
        title,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: const Color(0xff1A1B1F),
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xffF1F5F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: TColors.PrimaryColor),
      ),
      onTap: onTap,
    );
  }
}