import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/utils/assets_data.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';

class SignUpUsingGoogleWidget extends StatelessWidget {
  const SignUpUsingGoogleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            // log in with google
          },
          child: SizedBox(
            height: 48.h,
            width: 137.w,
            child: SvgPicture.asset(
              AssetsData.google,
              fit: BoxFit.fill,
            ),
          ),
        ),
        TextUtils(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          text: 'انشاء حساب  باستخدام ',
          color: MyColors.descriptionText,
        ),
      ],
    );
  }
}
