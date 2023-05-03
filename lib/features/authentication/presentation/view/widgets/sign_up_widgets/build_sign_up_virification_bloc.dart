import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/text_utils.dart';
import '../../../../../layout/layout.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';

Widget buildSignUpVirificationBloc() {
  return BlocListener<AuthCubit, AuthState>(
    listenWhen: ((previous, current) => previous != current),
    listener: ((context, state) {
      if (state is VerifySignUpSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LayOut(),
          ),
        );
      }
      if (state is VerifySignUpError) {
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
    }),
    child: Container(),
  );
}
