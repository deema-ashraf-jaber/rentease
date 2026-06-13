import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers.onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Obx(() {
      final isLastPage = controller.currentPageIndex.value == 2;

      return Positioned(
        bottom: TSizes.defaultSpace,
        right: TSizes.defaultSpace,
        left: TSizes.defaultSpace,
        child: isLastPage
            ? SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () => controller.nextPage(),
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.PrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              TTexts.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        )
            : Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            height: 55,
            width: 55,
            child: ElevatedButton(
              onPressed: () => controller.nextPage(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: TColors.PrimaryColor,
              ),
              child: const Icon(Icons.arrow_forward_ios, size: 18),
            ),
          ),
        ),
      );
    });
  }
}