import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/features/manager_profile_and_chat/presentation/view/widgets/manager_profile_widgets/my_container_with_title.dart';

import '../../../../../../core/utils/constant.dart';

class ExperiencesWidgets extends StatelessWidget {
  const ExperiencesWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainerWithTitle(
      hight: 167,
      title: 'الخبرات',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Text(
              'اهلا ومرحبا يسعدني ان اقدم لكم نفسي المحامي عمرو خبره 5 سنوات في مجال المحاماه وقمت بمساعده اكثر من مئه شخص وانا جاهز لمساعدتكيشرفني العمل معك ومساعدتك علي حل مشكلتك في اسرع  ',
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
