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
      title: 'المؤهلات',
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Text(
              'يعد المحامون في مصر مسؤولين عن تمثيل الموكلين في القضايا القانونية والدفاع عن حقوقهم في المحاكم. يجب على المحامين في مصر إتمام دراسة الحقوق وتلقي التدريب اللازم للحصول على شهادة المحاماة.',
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
