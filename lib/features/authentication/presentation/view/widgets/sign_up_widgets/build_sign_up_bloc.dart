import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';
import '../../../../../layout/layout.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';
import '../../screens/log_in_screen.dart';

Widget buildSignUpBloc() {
  return BlocListener<AuthCubit, AuthState>(
    listenWhen: ((previous, current) => previous != current),
    listener: ((context, state) {
      if (state is SignUpSuccess) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const LayOut(),
          ),
          (Route<dynamic> route) => false,
        );
      }
      if (state is SignUpError) {
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
      if (state is ThisEmailIsLoged) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LogInScreen(),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: TextUtils(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              text: 'هذا البريد مسجل بالفعل',
            ),
            backgroundColor: MyColors.primary,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }),
    child: Container(),
  );
}
