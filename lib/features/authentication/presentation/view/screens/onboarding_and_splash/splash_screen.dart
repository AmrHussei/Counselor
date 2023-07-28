import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/assets_data.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../layout/layout.dart';
import '../sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SplashScreenBody(),
      ),
    );
  }
}

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingTextAnimation;

  @override
  void initState() {
    initSlidingTextAnimation();
    navToHomeScreen();
    super.initState();
  }

  void navToHomeScreen() {
    Future.delayed(const Duration(seconds: 2), (() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (cntext) => UserDataConstant.token.isEmpty
              ? const SignUpScreen()
              : const LayOut()));
    }));
  }

  void initSlidingTextAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingTextAnimation =
        Tween<Offset>(begin: Offset(0, 4.h), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            AssetsData.onboardingBG,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 220.h,
              ),
              SizedBox(
                height: 330.h,
                width: 200.w,
                child: Image.asset(
                  AssetsData.splashLogo,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SlidingAnimation extends StatelessWidget {
  const SlidingAnimation({
    Key? key,
    required this.slidingTextAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingTextAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingTextAnimation,
      builder: (context, _) => SlideTransition(
        position: slidingTextAnimation,
        child: Text(
          'free books for you',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.sp),
        ),
      ),
    );
  }
}
