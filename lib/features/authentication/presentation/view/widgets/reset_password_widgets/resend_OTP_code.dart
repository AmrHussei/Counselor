import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';

class ResendOTPCode extends StatelessWidget {
  const ResendOTPCode({
    super.key,
    required this.onTap,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextUtils(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        text: 'لم يصلني الكود اعادة ارساله',
        color: MyColors.primary,
      ),
    );
  }
}
