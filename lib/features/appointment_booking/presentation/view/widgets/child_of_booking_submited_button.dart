import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/text_utils.dart';
import '../../view_model/booking_cubit/booking_cubit.dart';

class ChildOfBookingSubmitedButton extends StatelessWidget {
  const ChildOfBookingSubmitedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is BookingLoading) {
          return const CircularProgressIndicator(
            color: Colors.white,
          );
        } else if (state is BookingError) {
          return TextUtils(
            text: 'حاول مجددا',
            fontWeight: FontWeight.w400,
            fontSize: 14.h,
            color: Colors.white,
          );
        } else {
          return TextUtils(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            text: 'حجز الموعد',
            color: Colors.white,
          );
        }
      },
    );
  }
}
