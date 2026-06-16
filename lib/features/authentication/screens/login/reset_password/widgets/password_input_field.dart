import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.onVisibilityPressed,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onVisibilityPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: TColors.PrimaryColor,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          obscureText: obscureText,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: const Color(0xff77777780),
            ),
            filled: true,
            fillColor: const Color(0xffE8E8E8),
            prefixIcon: IconButton(
              onPressed: onVisibilityPressed,
              icon: const Icon(
                Icons.visibility_outlined,
                color: Color(0xffC6C6C6),
              ),
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