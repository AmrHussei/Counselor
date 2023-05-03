import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';
import '../../screens/sign_up_screen.dart';

class NavToSignUpScreen extends StatelessWidget {
  const NavToSignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ),
        );
      },
      child: TextUtils(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        text: 'انشاء حساب جديد',
        color: MyColors.primary,
      ),
    ).animate().fade(duration: 600.milliseconds).slideY(end: 0, begin: 1);
  }
}
