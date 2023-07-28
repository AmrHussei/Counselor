import 'package:flutter/material.dart';
import 'package:legal_advice_app/core/functions/delet_user_data.dart';

import '../../features/authentication/presentation/view/screens/onboarding_and_splash/onboarding_screen.dart';

Future<void> logOut(BuildContext context) async {
  await deletUserData();
  print('log out ----------------------------------------');
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const OnboardingScreen(),
    ),
  );
}
