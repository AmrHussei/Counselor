import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_advice_app/core/widgets/text_utils.dart';

import '../utils/assets_data.dart';

class ErrorWidgetForScreens extends StatelessWidget {
  const ErrorWidgetForScreens({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100.h,
        ),
        SizedBox(
          height: 220.h,
          width: double.infinity,
          child: Image.asset(AssetsData.errorImage),
        ),
        SizedBox(
          height: 25.h,
        ),
        TextUtils(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          text: 'لا يمكننا العثور على الصفحة المطلوبة رجاء حاول ثانية ',
        )
      ],
    );
  }
}

class ErrorWidgetForListView extends StatelessWidget {
  const ErrorWidgetForListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 177.h,
          width: 260.w,
          child: Image.asset(AssetsData.errorImage),
        ),
        SizedBox(
          height: 25.h,
        ),
        TextUtils(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          text: 'لا يمكننا العثور على المحتوي المطلوبة رجاء حاول ثانية ',
        )
      ],
    );
  }
}
