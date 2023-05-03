import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';
import '../../screens/reset_password_screen_one.dart';

class NavToResetPasswordScreen extends StatelessWidget {
  const NavToResetPasswordScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ResetPasswordScreenOne(),
              ),
            );
          },
          child: TextUtils(
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            text: 'نسيتي كلمه السر ؟',
            color: MyColors.deepBlue,
          ),
        ),
      ],
    );
  }
}
