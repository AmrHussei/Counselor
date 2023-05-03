import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../widgets/log_in_widgets/log_in_widget_email_and_password.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 19.sp,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 15.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5.h),
                SizedBox(
                  height: 199.h,
                  width: 191.w,
                  child: SvgPicture.asset(
                    AssetsData.logoSVG,
                    fit: BoxFit.fill,
                  )
                      .animate()
                      .fade(duration: 500.milliseconds)
                      .slide(curve: Curves.easeIn),
                ),
                SizedBox(height: 17.h),
                TextUtils(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  text: 'العدالة تتأخر لكنها لاتضيع',
                  color: MyColors.primary,
                )
                    .animate()
                    .fade(duration: 500.milliseconds)
                    .slide(curve: Curves.easeIn),
                SizedBox(height: 27.h),
                TextUtils(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  text: 'تسجيل الدخول',
                  color: Colors.black,
                )
                    .animate()
                    .fade(duration: 500.milliseconds)
                    .slide(curve: Curves.easeIn),
                SizedBox(height: 40.h),
                const LogInWidgetEmailAndPassword(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
