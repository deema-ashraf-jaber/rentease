import 'package:flutter/material.dart';

import '../../../../../bottom_navigation.dart';
import '../../../../../utils/constants/colors.dart';
import '../login.dart';
import 'widgets/continue_button.dart';
import 'widgets/success_icon_box.dart';
import 'widgets/success_text_section.dart';
import 'widgets/transaction_card.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 120),

              const SuccessIconBox(),

              const SizedBox(height: 48),

              const SuccessTextSection(),

              const SizedBox(height: 72),

              const TransactionCard(),

              const Spacer(),

              ContinueButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const LoginScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}