import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/features/manager_profile_and_chat/presentation/view/widgets/manager_profile_widgets/my_container_with_title.dart';

import '../../../../../../core/utils/constant.dart';

class QualificationsWidgets extends StatelessWidget {
  const QualificationsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainerWithTitle(
      hight: 167,
      title: 'المؤهلات',
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Text(
              'حاصل على بكالوريوس الحقوق وحاصل على ماجستير في القانون الجنائي والاوراق الماليه وقمت بتحضير الدكتوراه في الماليه العامه والضرائب ولدي خبرات كثيره جدا في هذا المجال وايضا قمت بدراسه العديد من المجالات مثل القانون الدولي العام والنظام الدستور وغيرها ايضا من المجالات العديده التي يمكننا التخصص بها وموجوده ايضا في مكتبي',
              style: GoogleFonts.almarai(
                fontSize: 14.sp,
                height: 2,
                fontWeight: FontWeight.w300,
                color: MyColors.descriptionText,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
