import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_advice_app/core/utils/constant.dart';
import 'package:legal_advice_app/core/utils/theme_manager.dart';
import 'package:legal_advice_app/features/layout/layout.dart';
import 'package:legal_advice_app/features/news%20_and_videos/presentation/view_model/videos_cubit/videos_cubit.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'core/helper/services_helper.dart';
import 'features/Community/presentation/view/screens/published_post_screen.dart';
import 'features/Community/presentation/view_model/community_cubit/community_cubit.dart';
import 'features/appointment_booking/presentation/view_model/booking_cubit/booking_cubit.dart';
import 'features/authentication/presentation/view/screens/onboarding_and_splash/onboarding_screen.dart';
import 'features/authentication/presentation/view/screens/onboarding_and_splash/splash_screen.dart';
import 'features/manager_profile_and_chat/presentation/view/screens/chat_screen.dart';
import 'features/manager_profile_and_chat/presentation/view/screens/manager_profile.dart';
import 'features/news _and_videos/presentation/view_model/news_cubit/news_cubit.dart';
import 'features/questions_and_dictionary/presentation/view/screens/dictionary_screen.dart';
import 'features/questions_and_dictionary/presentation/view/screens/questions_viewer.dart';
import 'features/appointment_booking/presentation/view/screens/appointment_booking_screen.dart';
import 'features/authentication/presentation/view/screens/reset_password_otp_screen.dart';
import 'features/authentication/presentation/view/screens/reset_password_screen_one.dart';
import 'features/authentication/presentation/view/screens/sign_up_screen.dart';
import 'features/authentication/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'features/news _and_videos/presentation/view/screens/news_screen.dart';
import 'features/news _and_videos/presentation/view/screens/videos_screen.dart';
import 'features/questions_and_dictionary/presentation/view_model/dictionary_cubit/dictionary_cubit.dart';
import 'features/questions_and_dictionary/presentation/view_model/questions_cubit/questions_cubit.dart';
import 'features/user_settings/presentation/view/screens/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServicesHelper.intiDio();
  runApp(const MyApp());
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
        BlocProvider(create: (context) => CommunityCubit()),
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
