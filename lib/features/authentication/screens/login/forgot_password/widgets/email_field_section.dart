import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class EmailFieldSection extends StatelessWidget {
  const EmailFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'البريد الإلكتروني',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: TColors.PrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          textAlign: TextAlign.right,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "example@email.com",
            filled: true,
            suffixIcon: const Icon(Icons.email_outlined),
            fillColor: Colors.grey.shade200,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}