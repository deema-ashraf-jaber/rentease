import 'package:flutter/material.dart';

class ChatDateLabel extends StatelessWidget {
  const ChatDateLabel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xffE8E7ED),
          borderRadius: BorderRadius.circular(99),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xff434750),
          ),
        ),
      ),
    );
  }
}