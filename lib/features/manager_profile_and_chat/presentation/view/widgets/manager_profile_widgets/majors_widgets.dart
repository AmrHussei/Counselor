import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_advice_app/features/manager_profile_and_chat/presentation/view/widgets/manager_profile_widgets/my_container_with_title.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';

class MajorsWidgets extends StatelessWidget {
  const MajorsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainerWithTitle(
      title: 'التخصصات',
      child: Padding(
        padding: EdgeInsets.all(6.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8.w,
              childAspectRatio: 2.9,
              crossAxisCount: 3,
              crossAxisSpacing: 8.h),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: TextUtils(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                text: 'اسم التخصص',
                color: Colors.white,
              ),
            );
          },
          itemCount: 15,
        ),
      ),
    );
  }
}
