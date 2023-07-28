import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_advice_app/core/utils/constant.dart';
import 'package:legal_advice_app/core/utils/theme_manager.dart';
import 'package:legal_advice_app/features/news%20_and_videos/presentation/view_model/videos_cubit/videos_cubit.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'core/helper/services_helper.dart';
import 'features/appointment_booking/presentation/view_model/booking_cubit/booking_cubit.dart';
import 'features/authentication/presentation/view/screens/onboarding_and_splash/onboarding_screen.dart';
import 'features/authentication/presentation/view/screens/onboarding_and_splash/splash_screen.dart';
import 'features/news _and_videos/presentation/view_model/news_cubit/news_cubit.dart';
import 'features/authentication/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'features/questions_and_dictionary/presentation/view_model/dictionary_cubit/dictionary_cubit.dart';
import 'features/questions_and_dictionary/presentation/view_model/questions_cubit/questions_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingHandlerOnBackground);
  await ServicesHelper.intiDio();
  runApp(const MyApp());
}

Future<void> firebaseMessagingHandlerOnBackground(RemoteMessage message) async {
  if (kDebugMode) {
    print(message.messageId);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => QuestionsCubit()),
        BlocProvider(create: (context) => BookingCubit()),
        BlocProvider(create: (context) => DictionaryCubit()),
        BlocProvider(create: (context) => NewsCubit()),
        BlocProvider(create: (context) => VideosCubit()),
      ],
      child: const _MyApp(),
    );
  }
}

class _MyApp extends StatefulWidget {
  const _MyApp();

  @override
  State<_MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      UserDataConstant.token = prefs.getString('token') ?? '';
      UserDataConstant.name = prefs.getString('name') ?? 'مجهول';
      UserDataConstant.email = prefs.getString('email') ?? '';
      UserDataConstant.id = prefs.getString('id') ?? '';
      print(' This is user data =============================================');
      print(
        '${UserDataConstant.token},,,${UserDataConstant.email},,,${UserDataConstant.id},,,${UserDataConstant.name}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          home: child,
        );
      },
      child: UserDataConstant.token.isEmpty
          ? const OnboardingScreen()
          : const SplashScreen(),
    );
  }
}
