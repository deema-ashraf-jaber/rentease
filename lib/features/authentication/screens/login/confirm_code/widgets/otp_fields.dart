import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../utils/constants/colors.dart';

class OtpFields extends StatelessWidget {
  const OtpFields({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.onChanged,
  });

  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final void Function(String value, int index) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
            (index) => SizedBox(
          width: 65,
          height: 65,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            cursorColor: TColors.PrimaryColor,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: TColors.PrimaryColor,
              fontWeight: FontWeight.bold,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: const Color(0xffEEEEEE),
              hintText: '-',
              hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: TColors.PrimaryColor,
                  width: 1.5,
                ),
              ),
            ),
            onChanged: (value) => onChanged(value, index),
          ),
        ),
      ),
    );
  }
}