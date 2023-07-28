import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';
import '../../screens/reset_password_screen_three.dart';

Widget buildVirificationBlocForForgetPasssword({required String email}) {
  return BlocListener<AuthCubit, AuthState>(
    listenWhen: ((previous, current) => previous != current),
    listener: ((context, state) {
      if (state is VarifyResetCodeForForgetPasswordSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPasswordScreenThree(email: email),
          ),
        );
      }
      if (state is VarifyResetCodeForForgetPasswordError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: TextUtils(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              text: 'حدث شئ ما خطأ حاول مجددا',
            ),
            backgroundColor: MyColors.pink,
            duration: const Duration(seconds: 3),
          ),
        );
      }
      if (state is ResendOTPCodeForForgetPasswordError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: TextUtils(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              text: 'حدث شئ ما خطأ حاول مجددا',
            ),
            backgroundColor: MyColors.pink,
            duration: const Duration(seconds: 3),
          ),
        );
      }
      if (state is ResendOTPCodeForForgetPasswordSucces) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: TextUtils(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              text: 'تم ارسال كود جديد',
              color: Colors.white,
            ),
            backgroundColor: MyColors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }),
    child: Container(),
  );
}
