import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../../../appointment_booking/presentation/view/screens/appointment_booking_screen.dart';
import '../../../../manager_profile_and_chat/presentation/view/screens/manager_profile.dart';

class ButtonsToNavToMyProfile extends StatelessWidget {
  const ButtonsToNavToMyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ManagerProfile(),
              ),
            );
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 13.h,
            ),
          ),
          child: Center(
            child: TextUtils(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              text: 'عرض المزيد',
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    AppointmentBookingScreen(showAppBar: true),
              ),
            );
          },
          color: MyColors.primary,
          minWidth: 135.w,
          height: 40.h,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Center(
            child: TextUtils(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              text: 'احجز الان',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
