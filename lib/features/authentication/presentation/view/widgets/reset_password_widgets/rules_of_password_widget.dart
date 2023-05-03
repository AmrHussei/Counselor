import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';

class RulesOfPasswordWidget extends StatelessWidget {
  const RulesOfPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextUtils(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          text: 'يجب ان تحتوي كلمة المرور علي 6 احرف علي الأقل',
          color: MyColors.descriptionText,
        ),
      ],
    );
  }
}
