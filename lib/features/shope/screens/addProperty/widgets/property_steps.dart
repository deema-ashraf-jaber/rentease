import 'package:flutter/material.dart';
import 'package:rentease/features/shope/screens/addProperty/widgets/step_item.dart';

class PropertySteps extends StatelessWidget {
  const PropertySteps({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 27,
            left: 1,
            right: 1,
            child: Container(
              height: 2,
              color: const Color(0xffE8E8E8),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StepItem(number: "١", title: "التفاصيل", active: true),
              StepItem(number: "٢", title: "الصور"),
              StepItem(number: "٣", title: "الموقع"),
              StepItem(number: "٤", title: "المراجعة"),
            ],
          ),
        ],
      ),
    );
  }
}