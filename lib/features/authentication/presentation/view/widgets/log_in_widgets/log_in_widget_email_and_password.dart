import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_advice_app/features/authentication/presentation/view/widgets/log_in_widgets/build_logIn_bloc.dart';
import 'package:legal_advice_app/features/authentication/presentation/view/widgets/log_in_widgets/child_of_logIn_submited_button.dart';
import 'package:legal_advice_app/features/authentication/presentation/view/widgets/log_in_widgets/nav_to_reset_password_screen.dart';
import 'package:legal_advice_app/features/authentication/presentation/view/widgets/log_in_widgets/nav_to_sign_up_screen.dart';

import '../../../../../../core/utils/assets_data.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/auth_text_form_filed.dart';
import '../../../../../../core/widgets/submited_button.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';

class LogInWidgetEmailAndPassword extends StatefulWidget {
  const LogInWidgetEmailAndPassword({
    super.key,
  });

  @override
  State<LogInWidgetEmailAndPassword> createState() =>
      _LogInWidgetEmailAndPasswordState();
}

class _LogInWidgetEmailAndPasswordState
    extends State<LogInWidgetEmailAndPassword> {
  bool obscureText = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextFormFiled(
            controller: emailController,
            obscureText: false,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (!RegExp(validationEmail).hasMatch(value)) {
                return 'ادخلي بريد الكتروني صحيح من فضلك';
              }
            },
            hintText: 'example@gmail.com',
            prefixIcon: const SizedBox(),
            suffixIcon: AssetsData.emailIcon,
            headerText: 'البريد الالكتروني',
          ).animate().fade(duration: 550.milliseconds).slideX(),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(height: 16.h),
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
            hintText: '*********',
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
          ).animate().fade(duration: 700.milliseconds).slideX(),
          SizedBox(
            height: 14.h,
          ),
          SizedBox(
            height: 14.h,
          ),
          const NavToResetPasswordScreen()
              .animate()
              .fade(duration: 700.milliseconds)
              .slideX(),
          SizedBox(
            height: 14.h,
          ),
          SizedBox(height: 40.h),
          SubmitedButton(
            child: const ChildOfLogInSubmitedButton(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).logIn(
                  email: emailController.text,
                  password: passwordController.text,
                );
              }
            },
          ).animate().fade(duration: 500.milliseconds).slideY(end: 0, begin: 1),
          SizedBox(height: 32.h),
          const NavToSignUpScreen(),
          buildLogInBloc()
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
