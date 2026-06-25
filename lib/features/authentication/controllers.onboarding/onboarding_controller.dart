import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final PageController pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {

      GetStorage().write('seenOnboarding', true);

      Get.offAll(() => const LoginScreen());

    } else {
      final page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}