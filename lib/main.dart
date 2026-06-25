import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'bottom_navigation.dart';
import 'features/authentication/screens/login/login.dart';
import 'features/authentication/screens/onboarding/onboarding.dart';
import 'features/authentication/screens/signup/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await Supabase.initialize(
    url: 'https://puxbfemhtcueetuxdptr.supabase.co',
    anonKey: 'sb_publishable__r9PpIN50avQ0JWfF3qnlg_duMa3qqz',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
      ],
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();

    final user = Supabase.instance.client.auth.currentUser;
    final seenOnboarding = storage.read('seenOnboarding') ?? false;

    if (user != null) {
      return const BottomNavigationScreen();
    }

    if (!seenOnboarding) {
      return const OnBoardingScreen();
    }

    return const LoginScreen();
  }
}