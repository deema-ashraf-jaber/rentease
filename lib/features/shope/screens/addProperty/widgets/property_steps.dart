import 'package:flutter/material.dart';
import 'package:rentease/features/shope/screens/addProperty/widgets/step_item.dart';

class PropertySteps extends StatelessWidget {
  final int activeStep;

  const PropertySteps({
    super.key,
    required this.activeStep,
  });

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StepItem(
                number: "١",
                title: "التفاصيل",
                active: activeStep == 1,
              ),
              StepItem(
                number: "٢",
                title: "الصور",
                active: activeStep == 2,
              ),
              StepItem(
                number: "٣",
                title: "الموقع",
                active: activeStep == 3,
              ),
              StepItem(
                number: "٤",
                title: "المراجعة",
                active: activeStep == 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}