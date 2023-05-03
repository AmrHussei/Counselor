import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_advice_app/features/authentication/presentation/view/screens/reset_password_screen_three.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/submited_button.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
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
              pinCodeWidget(context),
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
              buildVirificationBlocForForgetPasssword()
            ],
          ),
        ),
      ),
    ));
  }

  Widget pinCodeWidget(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: false,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      textStyle: TextStyle(color: Colors.black, fontSize: 17.sp),
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(6.sp),
          fieldHeight: 45.h,
          fieldWidth: 35.w,
          activeFillColor: MyColors.lightPrimary,
          activeColor: MyColors.primary,
          inactiveColor: MyColors.primary,
          inactiveFillColor: MyColors.authTextFormFiled,
          selectedColor: MyColors.primary,
          selectedFillColor: Colors.white),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: (code) {
        otpCode = code;
        print("Completed");
      },
      onChanged: (code) {
        print(code);
      },
    ).animate().fade(duration: 500.milliseconds).slide(curve: Curves.easeIn);
  }

  Widget buildVirificationBlocForForgetPasssword() {
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
}
