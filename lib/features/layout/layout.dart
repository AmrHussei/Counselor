import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/features/layout/drawer.dart';

import '../../core/utils/assets_data.dart';
import '../../core/utils/constant.dart';
import '../questions_and_dictionary/presentation/view/screens/questions_screen.dart';
import '../Community/presentation/view/screens/community_screen.dart';
import '../home/presentation/view/screens/home_screen.dart';
import '../manager_profile_and_chat/presentation/view/screens/chat_screen.dart';
import '../user_settings/presentation/view/screens/user_profile.dart';

class LayOut extends StatefulWidget {
  const LayOut({super.key});

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  // ignore: non_constant_identifier_names
  int IndexOfPage = 3;
  List<Widget> taps = [
    CommunityMainScreen(),
    ChatScreen(),
    QuestionsScreen(),
    HomeScreen(),
  ];
  List<String> appBarText = [
    'المجتمع',
    'راسلني',
    'اسئله شائعه',
    'الرئيسيه',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.h),
          child: AppBar(
            actions: [
              SizedBox(
                height: 24.h,
                width: 24.w,
                child: SvgPicture.asset(
                  AssetsData.notification,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UserProfile(),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 19.sp,
                  backgroundImage: NetworkImage(
                    urlImage,
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              )
            ],
            iconTheme: IconThemeData(
              size: 28.sp,
              color: Colors.black, // set your desired color here
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            title: Column(
              children: [
                SizedBox(
                  height: 56.h,
                  width: 54.w,
                  child: SvgPicture.asset(
                    AssetsData.logoSVG,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                IndexOfPage = index;
              });
            },
            showUnselectedLabels: true,
            selectedLabelStyle: GoogleFonts.tajawal(
                fontSize: 13.sp,
                color: MyColors.primary,
                fontWeight: FontWeight.w400),
            unselectedLabelStyle: GoogleFonts.tajawal(
              fontSize: 12.sp,
              color: MyColors.greyBorders,
            ),
            selectedItemColor: MyColors.primary,
            unselectedItemColor: MyColors.greyBorders,
            currentIndex: IndexOfPage,
            useLegacyColorScheme: false,
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 18.w,
                  height: 18.w,
                  child: SvgPicture.asset(
                    IndexOfPage == 0
                        ? AssetsData.communityActive
                        : AssetsData.communityGrey,
                    fit: BoxFit.fill,
                  ),
                ),
                label: 'المنتدي',
              ),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 18.w,
                    height: 18.w,
                    child: SvgPicture.asset(
                      IndexOfPage == 1
                          ? AssetsData.messagingMeActive
                          : AssetsData.messagingMeGreey,
                      fit: BoxFit.fill,
                    ),
                  ),
                  label: 'راسلني'),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 18.w,
                    height: 18.w,
                    child: SvgPicture.asset(
                      IndexOfPage == 2
                          ? AssetsData.questionActive
                          : AssetsData.questionGreey,
                      fit: BoxFit.fill,
                    ),
                  ),
                  label: 'اسئله شائعه'),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 18.w,
                    height: 18.w,
                    child: SvgPicture.asset(
                      IndexOfPage == 3
                          ? AssetsData.homeActive
                          : AssetsData.homeGrey,
                      fit: BoxFit.fill,
                    ),
                  ),
                  label: 'الرئيسيه'),
            ]),
        body: taps[IndexOfPage],
      ),
    );
  }
}