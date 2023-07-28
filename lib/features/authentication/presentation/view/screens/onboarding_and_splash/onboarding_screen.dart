import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/assets_data.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';
import '../sign_up_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  static int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              reverse: true,
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              controller: _pageController,
              itemCount: Onboarding.data.length,
              itemBuilder: (context, index) => OnboardingContent(
                descriptionText: Onboarding.data[index].descriptionText,
                image: Onboarding.data[index].image,
              ),
            ),
            Positioned(
              top: 620.h,
              left: 55.w,
              child: MaterialButton(
                onPressed: () {
                  if (_pageIndex == 1) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                },
                color: Colors.white,
                minWidth: 255.w,
                height: 48.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: TextUtils(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  text: 'التالي',
                  color: MyColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Onboarding {
  Onboarding({
    required this.image,
    required this.descriptionText,
  });
  final String image, descriptionText;

  static final List<Onboarding> data = [
    Onboarding(
      image: AssetsData.onboarding1,
      descriptionText:
          'مرحباً بك في تطبيق استشارات القانونية،\n نحن نسعد بخدمتك وتقديم المشورة\n القانونية اللازمة لك.',
    ),
    Onboarding(
      image: AssetsData.onboarding2,
      descriptionText:
          'مرحباً بك في تطبيق استشارات القانونية،\n نحن نسعد بخدمتك وتقديم المشورة\n القانونية اللازمة لك.',
    ),
  ];
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.descriptionText,
    required this.image,
  });
  final String descriptionText, image;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 220.h,
            ),
            SizedBox(
              height: 223.h,
              width: 173.w,
              child: SvgPicture.asset(image),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(descriptionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    Onboarding.data.length,
                    (index) => Padding(
                          padding: EdgeInsets.all(4.w),
                          child: DotIndicator(
                            isActive:
                                index == _OnboardingScreenState._pageIndex,
                          ),
                        )),
              ],
            )
          ],
        ),
      )
    ]);
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 10.w : 8.w,
      width: isActive ? 10.w : 8.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
      ),
    );
  }
}
