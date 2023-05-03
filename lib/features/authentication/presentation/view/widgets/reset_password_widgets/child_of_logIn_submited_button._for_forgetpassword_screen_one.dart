import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/text_utils.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';

class ChildOfSubmitedButtonForForgetPasswordScreenOne extends StatelessWidget {
  const ChildOfSubmitedButtonForForgetPasswordScreenOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is ForgetPasswordSuccess) {
        return TextUtils(
          text: 'لحظه من فضلك',
          fontWeight: FontWeight.w500,
          fontSize: 15.h,
          color: Colors.white,
        );
      } else if (state is ForgetPasswordError) {
        return TextUtils(
          text: 'حاول مجددا',
          fontWeight: FontWeight.w500,
          fontSize: 15.h,
          color: Colors.white,
        );
      } else if (state is ForgetPasswordLoading) {
        return const CircularProgressIndicator(
          color: Colors.white,
        );
      } else {
        return TextUtils(
          text: 'ارسال',
          fontWeight: FontWeight.w500,
          fontSize: 15.h,
          color: Colors.white,
        );
      }
    });
  }
}
