import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onActionPressed;
  final IconData? actionIcon;
  final Color foregroundColor;

  const TAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.onActionPressed,
    this.actionIcon,
    this.foregroundColor = TColors.PrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: IconButton(
          onPressed: () {
          },
          icon: Icon(Icons.arrow_back, color: foregroundColor, size: 28),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 22,
          letterSpacing: -0.5,
          color: foregroundColor,
        ),
      ),
      actions: [
        if (actionIcon != null)
          Padding(
            padding: const EdgeInsets.only(left:10),
            child: IconButton(
              onPressed: onActionPressed,
              icon: Icon(actionIcon, color: foregroundColor, size: 26),
            ),
          ),
      ],
    );
  }
  

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
