import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:legal_advice_app/features/layout/drawer.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../core/utils/assets_data.dart';
import '../../core/utils/constant.dart';
import '../appointment_booking/presentation/view/screens/appointment_booking_screen.dart';
import '../questions_and_dictionary/presentation/view/screens/questions_screen.dart';
import '../home/presentation/view/screens/home_screen.dart';
import '../manager_profile_and_chat/presentation/view/screens/chat_screen.dart';
import '../user_settings/presentation/view/screens/user_profile.dart';

int IndexOfPage = 3;

class LayOut extends StatefulWidget {
  const LayOut({super.key});

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  // ignore: non_constant_identifier_names

  bool amr = false;
  List<Widget> taps = [
    AppointmentBookingScreen(showAppBar: false),
    ChatScreen(),
    QuestionsScreen(),
    HomeScreen(),
  ];

  @override
  void initState() {
    socket = IO.io('https://legal-advice-1812.onrender.com', {
      'transports': ['websocket'],
      'autoConnect': false
    });
    socket!.connect();
    socket!.emit('joinRoom', UserDataConstant.id);
    socket!.onConnect((_) {
      print('+++++++++++++++++++++++++++ connect ++++++++++++++++++++++++');
    });

    socket!.on('message', (data) {
      //fro admin
      setState(() {
        amr = true;
        print('+++++++++++++++++++++++++++ data  ++++++++++++++++++++++++');
        print(' data dev $data');
        final newdata = Message.fromJson(data);
        messages.add(newdata);
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 90.h,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });

      print(data);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.h),
          child: AppBar(
            actions: [
              /*   SizedBox(
                height: 24.h,
                width: 24.w,
                child: SvgPicture.asset(
                  AssetsData.notification,
                  fit: BoxFit.contain,
                ),
              ),*/
              SizedBox(
                width: 10.w,
              ),
              InkWell(
                onTap: () {
                  /*    Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UserProfile(),
                    ),
                  );*/
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
                label: 'حجز المكتب',
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
                  label: amr ? 'راسلني' : 'not msg'),
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
        body: LazyLoadIndexedStack(
          index: IndexOfPage,
          children: taps,
        ),
      ),
    );
  }
}
