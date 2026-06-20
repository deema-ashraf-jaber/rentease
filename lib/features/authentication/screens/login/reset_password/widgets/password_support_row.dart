import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../utils/constants/colors.dart';

class PasswordSupportRow extends StatelessWidget {
  const PasswordSupportRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed:  () => _callSupport(),
          child: Text(
            ' تواصل مع الدعم',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: TColors.PrimaryColor,
              fontSize: 13,
              decoration: TextDecoration.underline,
            ),
          ),
        ),

        Text(
          ' هل تواجه مشكلة؟  ',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: const Color(0xff474747),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

Future<void> _callSupport() async {
  final Uri phoneUri = Uri(scheme: 'tel', path: '0599999999');

  if (!await launchUrl(phoneUri)) {
    throw Exception('Could not launch phone');
  }
}