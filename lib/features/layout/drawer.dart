import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_advice_app/features/authentication/presentation/view_model/auth_cubit/auth_cubit.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/assets_data.dart';
import '../../core/utils/constant.dart';
import '../../core/widgets/text_utils.dart';
import '../appointment_booking/presentation/view/screens/appointment_booking_screen.dart';
import '../authentication/presentation/view/screens/onboarding_and_splash/onboarding_screen.dart';
import '../manager_profile_and_chat/presentation/view/screens/manager_profile.dart';
import '../news _and_videos/presentation/view/screens/news_screen.dart';
import '../news _and_videos/presentation/view/screens/videos_screen.dart';
import '../questions_and_dictionary/presentation/view/screens/dictionary_screen.dart';
import '../user_settings/presentation/view/screens/user_profile.dart';

final urlImage =
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

class NavigationDrawerWidget extends StatefulWidget {
  NavigationDrawerWidget({super.key});

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 15.w);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: MyColors.lightPrimary,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: UserDataConstant.name,
              email: UserDataConstant.email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserProfile(),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  //   const SizedBox(height: 12),
                  //  buildSearchField(),
                  SizedBox(height: 24.h),
                  buildMenuItem(
                    text: 'القاموس القانوني',
                    image: AssetsData.dictionary,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  SizedBox(height: 16.h),
                  buildMenuItem(
                    text: 'أخر الاخبار',
                    image: AssetsData.news,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  SizedBox(height: 16.h),
                  buildMenuItem(
                    text: 'الفديوهات',
                    image: AssetsData.vedios,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  SizedBox(height: 16.h),
                  buildMenuItem(
                    text: 'عني',
                    image: AssetsData.profile,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  SizedBox(height: 24.h),
                  const Divider(color: Colors.black),
                  SizedBox(height: 24.h),
                  buildMenuItem(
                    text: 'حجز موعد',
                    image: AssetsData.bookingPNG,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  SizedBox(height: 16.h),
                  /*  buildMenuItem(
                    text: 'الاشعارات',
                    image: AssetsData.notificationPNG,
                    onClicked: () => selectedItem(context, 5),
                  ),*/
                  buildMenuItem(
                    text: 'تسجيل الخروج',
                    image: AssetsData.notificationPNG,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  buildMenuItem(
                    text: 'حذف الحساب',
                    image: AssetsData.splashLogo,
                    onClicked: () => selectedItem(context, 6),
                  ),
                  buildDrawerBloc()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40.h)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.sp,
                backgroundImage: NetworkImage(
                  urlImage,
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      text: name,
                    ),
                    SizedBox(height: 4.h),
                    TextUtils(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      text: email,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required String image,
    VoidCallback? onClicked,
  }) {
    const color = Colors.black;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: SizedBox(
        height: 24.h,
        width: 24.w,
        child: Image.asset(
          image,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const DictionaryScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const NewsScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const VideosScreen(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ManagerProfile(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AppointmentBookingScreen(showAppBar: true),
        ));
        break;
      case 5:
        _logOut();
        break;
      case 6:
        showCupertinoAlertDialogForDeletUser(context);
        break;
    }
  }

  void showCupertinoAlertDialogForDeletUser(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: TextUtils(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            text: 'هل أنت متأكد أنك تريد حذف حسابك؟',
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is DeletUsersLoading) {
                    return SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: CircularProgressIndicator());
                  } else if (state is DeletUsersError) {
                    return TextUtils(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      text: 'حاول مجددا',
                      color: MyColors.pink,
                    );
                  } else {
                    return TextUtils(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      text: 'نعم حذف',
                      color: MyColors.pink,
                    );
                  }
                },
              ),
              onPressed: () async {
                BlocProvider.of<AuthCubit>(context).deletUser();
              },
            ),
            CupertinoDialogAction(
              child: TextUtils(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                text: 'لا',
                color: MyColors.primary,
              ),
              onPressed: () {
                // Perform the desired action here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildDrawerBloc() {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: ((previous, current) => previous != current),
      listener: ((context, state) {
        if (state is DeletUsersSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const OnboardingScreen()),
            (Route<dynamic> route) => false,
          );
        }
        if (state is DeletUsersError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: TextUtils(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                text: 'حدث شئ ما خطا حاول مجددا',
              ),
              backgroundColor: MyColors.pink,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }),
      child: Container(),
    );
  }

  Future<void> _logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', '');
    await prefs.setString('name', '');
    await prefs.setString('email', '');
    await prefs.setString('id', '');
    setState(() {
      UserDataConstant.token = '';
      UserDataConstant.name = '';
      UserDataConstant.email = '';
      UserDataConstant.id = '';
      print(' This is user data =============================================');
      print(
        '${UserDataConstant.token},,,${UserDataConstant.email},,,${UserDataConstant.id},,,${UserDataConstant.name}',
      );
    });
    print('log out ----------------------------------------');
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OnboardingScreen(),
      ),
    );
  }
}
