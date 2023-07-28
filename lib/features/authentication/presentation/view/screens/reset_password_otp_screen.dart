import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/pin_code_widget.dart';
import '../../../../../core/widgets/submited_button.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import '../widgets/reset_password_widgets/build_forget_password_otp_bloc.dart';
import '../widgets/reset_password_widgets/child_of_submited_button_for_OTP_forget_password.dart';
import '../widgets/reset_password_widgets/resend_OTP_code.dart';

// ignore: must_be_immutable
class ResetPasswordOTPScreen extends StatelessWidget {
  ResetPasswordOTPScreen({super.key, required this.email});

  late String otpCode;
  final String email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 19.sp,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 15.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              SizedBox(
                height: 216.h,
                width: 216.w,
                child: SvgPicture.asset(
                  AssetsData.verifyCode,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 32.h),
              TextUtils(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                text: 'كود التفعيل',
              )
                  .animate()
                  .fade(duration: 500.milliseconds)
                  .slide(curve: Curves.easeIn),
              SizedBox(height: 32.h),
              TextUtils(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                text: 'ادخل الرمز المرسل علي البريد الاليكتروني',
                color: MyColors.descriptionText,
              )
                  .animate()
                  .fade(duration: 500.milliseconds)
                  .slide(curve: Curves.easeIn),
              SizedBox(height: 24.h),
              pinCodeWidget(context: context, otpCode: otpCode),
              SizedBox(height: 32.h),
              SubmitedButton(
                child: const ChildOfSubmitedButtonForOTPForgetPassword(),
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context)
                      .varifyResetCodeForForgetPassword(
                    email: email,
                    resetCode: otpCode,
                  );
                },
              ).animate().fade(duration: 600.milliseconds).slideX(),
              SizedBox(
                height: 22.h,
              ),
              ResendOTPCode(
                onTap: () {
                  BlocProvider.of<AuthCubit>(context)
                      .resendOTPCodeForForgetPassword(
                    email: email,
                  );
                },
              ),
              buildVirificationBlocForForgetPasssword(email: email)
            ],
          ),
        ),
      ),
    ));
  }
}
