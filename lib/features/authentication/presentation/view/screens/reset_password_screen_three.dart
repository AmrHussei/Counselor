import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/auth_text_form_filed.dart';
import '../../../../../core/widgets/submited_button.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import '../widgets/reset_password_widgets/build_reset_password_otp_bloc_three.dart';
import '../widgets/reset_password_widgets/child_of_logIn_submited_button._for_forgetpassword_screen_three.dart';
import '../widgets/reset_password_widgets/rules_of_password_widget.dart';

class ResetPasswordScreenThree extends StatefulWidget {
  const ResetPasswordScreenThree({super.key, required this.email});

  final String email;

  @override
  State<ResetPasswordScreenThree> createState() =>
      _ResetPasswordScreenThreeState();
}

class _ResetPasswordScreenThreeState extends State<ResetPasswordScreenThree> {
  bool obscureText = true;
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController repeatPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 15.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                TextUtils(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  text: 'برجاء كتابة كلمة المرور',
                  color: MyColors.primary,
                )
                    .animate()
                    .fade(duration: 500.milliseconds)
                    .slide(curve: Curves.easeIn),
                SizedBox(height: 24.h),
                TextUtils(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  text: 'ادخال كلمة المرور الجديدة',
                  color: MyColors.descriptionText,
                )
                    .animate()
                    .fade(duration: 500.milliseconds)
                    .slide(curve: Curves.easeIn),
                SizedBox(height: 24.h),
                AuthTextFormFiled(
                  controller: passwordController,
                  obscureText: obscureText,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value.toString().length < 6) {
                      return 'يجب ان تحتوي كلمه المرور علي 6 احرف علي الاقل';
                    } else {
                      return null;
                    }
                  },
                  hintText: '',
                  prefixIcon: IconButton(
                    icon: obscureText
                        ? SizedBox(
                            height: 18.h,
                            width: 18.w,
                            child: SvgPicture.asset(
                              AssetsData.visibilityActive,
                              fit: BoxFit.fill,
                            ),
                          )
                        : SizedBox(
                            height: 18.h,
                            width: 18.w,
                            child: SvgPicture.asset(
                              AssetsData.visibilityGrey,
                              fit: BoxFit.fill,
                            ),
                          ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                  suffixIcon: AssetsData.passwordIcon,
                  headerText: 'كلمه المرور',
                ).animate().fade(duration: 500.milliseconds).slideX(),
                SizedBox(height: 5.h),
                const RulesOfPasswordWidget(),
                SizedBox(height: 12.h),
                AuthTextFormFiled(
                  controller: repeatPasswordController,
                  obscureText: obscureText,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value.toString().length < 6 ||
                        passwordController.text !=
                            repeatPasswordController.text) {
                      return 'يجب ان تكون كلمات المرور متطابقه';
                    } else {
                      return null;
                    }
                  },
                  hintText: '',
                  prefixIcon: IconButton(
                    icon: obscureText
                        ? SizedBox(
                            height: 18.h,
                            width: 18.w,
                            child: SvgPicture.asset(
                              AssetsData.visibilityActive,
                              fit: BoxFit.fill,
                            ),
                          )
                        : SizedBox(
                            height: 18.h,
                            width: 18.w,
                            child: SvgPicture.asset(
                              AssetsData.visibilityGrey,
                              fit: BoxFit.fill,
                            ),
                          ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                  suffixIcon: AssetsData.passwordIcon,
                  headerText: 'تأكيد كلمه المرور',
                ).animate().fade(duration: 600.milliseconds).slideX(),
                SizedBox(height: 5.h),
                const RulesOfPasswordWidget(),
                SizedBox(height: 32.h),
                SubmitedButton(
                  child:
                      const ChildOfSubmitedButtonForForgetPasswordScreenThree(),
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        passwordController.text ==
                            repeatPasswordController.text) {
                      BlocProvider.of<AuthCubit>(context).resetPasswordThree(
                        newPassword: passwordController.text,
                        email: widget.email,
                      );
                    }
                  },
                ).animate().fade(duration: 700.milliseconds).slideX(),
                buildBlocForResetPasssword()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
