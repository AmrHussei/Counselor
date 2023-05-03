import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/submited_button.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import '../widgets/sign_up_widgets/build_sign_up_virification_bloc.dart';
import '../widgets/sign_up_widgets/child_of_submited_button_for_OTP_sign_up.dart';
/*
// ignore: must_be_immutable
class OTPSignUpScreen extends StatelessWidget {
  OTPSignUpScreen({super.key, required this.email});
  final String email;
  late String otpCode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 19.sp,
              color: Colors.white,
            ),
          )
        ],
        title: const Text('تأكيد انشاء الحساب'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 15.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              TextUtils(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                text: 'برجاء كتابة الكود',
              )
                  .animate()
                  .fade(duration: 500.milliseconds)
                  .slide(curve: Curves.easeIn),
              SizedBox(height: 24.h),
              TextUtils(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                text: ' من فضلك ادخل الكود الذي تم ارساله الي ',
                color: MyColors.descriptionText,
              )
                  .animate()
                  .fade(duration: 500.milliseconds)
                  .slide(curve: Curves.easeIn),
              SizedBox(height: 5.h),
              TextUtils(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                text: 'بريدك الالكتروني',
                color: MyColors.descriptionText,
              )
                  .animate()
                  .fade(duration: 500.milliseconds)
                  .slide(curve: Curves.easeIn),
              SizedBox(height: 20.h),
              pinCodeWidget(context),
              SizedBox(height: 32.h),
              SubmitedButton(
                child: const ChildOfSubmitedButtonForOTPSignUp(),
                onPressed: () {
                  print('this is email 000000000000000000000000$email');
                  BlocProvider.of<AuthCubit>(context).varifyResetCodeForSignup(
                    resetCode: otpCode,
                    email: email,
                  );
                },
              ).animate().fade(duration: 600.milliseconds).slideX(),
              buildSignUpVirificationBloc()
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
          inactiveFillColor: Colors.white,
          selectedColor: MyColors.primary,
          selectedFillColor: Colors.white),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: (code) {
        otpCode = code;
        print("Completed***********************$otpCode");
      },
      onChanged: (code) {
        print(code);
      },
    ).animate().fade(duration: 500.milliseconds).slide(curve: Curves.easeIn);
  }
}
*/