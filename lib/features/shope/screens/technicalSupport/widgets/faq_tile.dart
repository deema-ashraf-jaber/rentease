import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';

class FaqTile extends StatefulWidget {
  final String title;
  final String answer;

  const FaqTile({
    super.key,
    required this.title,
    required this.answer,
  });

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.26),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.2),
          border: Border.all(
            color: const Color(0xffE3E2E7),
            width: 1.02,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: TColors.PrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const Spacer(),

                Icon(
                  isOpen
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: TColors.PrimaryColor,
                  size: 24,
                ),
              ],
            ),

            if (isOpen) ...[
              const SizedBox(height: 12),
              Text(
                widget.answer,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Color(0xff666666),
                  fontSize: 14,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}