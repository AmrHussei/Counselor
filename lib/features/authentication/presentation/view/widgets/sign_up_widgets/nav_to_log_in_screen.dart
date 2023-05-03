import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';
import '../../screens/log_in_screen.dart';

class NavTologInScreen extends StatelessWidget {
  const NavTologInScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LogInScreen(),
          ),
        );
      },
      child: TextUtils(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        text: 'تسجيل الدخول',
        color: MyColors.primary,
      ),
    );
  }
}
