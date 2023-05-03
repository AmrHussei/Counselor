import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_advice_app/features/authentication/presentation/view/widgets/sign_up_widgets/child_of_submited_button_for_sign_up.dart';
import 'package:legal_advice_app/features/authentication/presentation/view/widgets/sign_up_widgets/nav_to_log_in_screen.dart';

import '../../../../../../core/utils/assets_data.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/auth_text_form_filed.dart';
import '../../../../../../core/widgets/submited_button.dart';
import '../../../../../../core/widgets/text_utils.dart';
import '../../../../../layout/layout.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';
import '../../screens/OTP_sign_up_screen.dart';
import '../../screens/log_in_screen.dart';

class SignUpWidgetEmailAndPassword extends StatefulWidget {
  const SignUpWidgetEmailAndPassword({
    super.key,
  });

  @override
  State<SignUpWidgetEmailAndPassword> createState() =>
      _SignUpWidgetEmailAndPasswordState();
}

class _SignUpWidgetEmailAndPasswordState
    extends State<SignUpWidgetEmailAndPassword> {
  bool obscureText = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextFormFiled(
            controller: userNameController,
            obscureText: false,
            textInputType: TextInputType.text,
            validator: (value) {
              if (value.toString().length <= 2 ||
                  !RegExp(validationName).hasMatch(value)) {
                return 'ادخلي اسم صحيح من فضلك';
              } else {
                return null;
              }
            },
            hintText: 'الاسم كامل',
            prefixIcon: const SizedBox(),
            suffixIcon: AssetsData.userNameIcon,
            headerText: 'اسم المستخدم',
          ).animate().fade(duration: 500.milliseconds).slideX(),
          SizedBox(height: 20.h),
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
          ).animate().fade(duration: 600.milliseconds).slideX(),
          SizedBox(height: 20.h),
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
            headerText: 'كلمه السر',
          ).animate().fade(duration: 700.milliseconds).slideX(),
          SizedBox(
            height: 14.h,
          ),
          SizedBox(height: 90.h),
          SubmitedButton(
            child: const ChildOfSubmitedButtonForSignUp(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).signUp(
                  name: userNameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );
              }
            },
          ).animate().fade(duration: 500.milliseconds).slideY(end: 0, begin: 1),
          SizedBox(height: 32.h),
          const NavTologInScreen()
              .animate()
              .fade(duration: 500.milliseconds)
              .slideY(end: 0, begin: 1),
          buildSignUpBloc(), //*** email*****/
        ],
      ),
    );
  }

  Widget buildSignUpBloc() {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: ((previous, current) => previous != current),
      listener: ((context, state) {
        if (state is SignUpSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LayOut(),
            ),
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
}
