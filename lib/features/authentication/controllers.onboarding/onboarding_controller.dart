import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final PageController pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  /// Update Dots when swiping
  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  /// Click on dots
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Skip button
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  /// Next button
  void nextPage() {
    if (currentPageIndex.value == 2) {
      // هون بتحطي صفحة تسجيل الدخول
      // Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}