import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';
import '../../screens/reset_password_otp_screen.dart';

Widget buildForgetPasswordScreenOneBloc({required String email}) {
  return BlocListener<AuthCubit, AuthState>(
    listenWhen: ((previous, current) => previous != current),
    listener: ((context, state) {
      if (state is ForgetPasswordSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPasswordOTPScreen(email: email),
          ),
        );
      }
      if (state is ForgetPasswordError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: TextUtils(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              text: 'حدث شئ ما خطأ حاول ببريد اخر او حاول مجددا',
            ),
            backgroundColor: MyColors.pink,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }),
    child: Container(),
  );
}
