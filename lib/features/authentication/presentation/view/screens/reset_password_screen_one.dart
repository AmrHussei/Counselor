import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_advice_app/features/authentication/presentation/view/screens/reset_password_otp_screen.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/auth_text_form_filed.dart';
import '../../../../../core/widgets/my_app_bar.dart';
import '../../../../../core/widgets/submited_button.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import '../widgets/reset_password_widgets/child_of_logIn_submited_button._for_forgetpassword_screen_one.dart';

class ResetPasswordScreenOne extends StatelessWidget {
  ResetPasswordScreenOne({super.key});
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: myAppBar(
        context,
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
                  text: 'برجاء كتابة بريدك الالكتروني',
                  color: MyColors.primary,
                )
                    .animate()
                    .fade(duration: 500.milliseconds)
                    .slide(curve: Curves.easeIn),
                SizedBox(height: 32.h),
                TextUtils(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  text: 'سيتم ارسال كود اعادة تعين كلمة المرور',
                  color: MyColors.descriptionText,
                )
                    .animate()
                    .fade(duration: 500.milliseconds)
                    .slide(curve: Curves.easeIn),
                SizedBox(height: 5.h),
                TextUtils(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  text: 'عبر البريد الاليكتروني',
                  color: MyColors.descriptionText,
                )
                    .animate()
                    .fade(duration: 500.milliseconds)
                    .slide(curve: Curves.easeIn),
                SizedBox(height: 16.h),
                AuthTextFormFiled(
                  controller: emailController,
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return 'ادخلي بريد الكتروني صحيح من فضلك';
                    }
                  },
                  hintText: '',
                  prefixIcon: const SizedBox(),
                  suffixIcon: AssetsData.emailIcon,
                  headerText: 'البريد الالكتروني',
                ).animate().fade(duration: 500.milliseconds).slideX(),
                SizedBox(height: 32.h),
                SubmitedButton(
                  child:
                      const ChildOfSubmitedButtonForForgetPasswordScreenOne(), //text:,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context)
                          .forgetPasswordFirstRequest(
                        email: emailController.text,
                      );
                    }
                  },
                ).animate().fade(duration: 600.milliseconds).slideX(),
                _buildForgetPasswordScreenOneBloc(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildForgetPasswordScreenOneBloc() {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: ((previous, current) => previous != current),
      listener: ((context, state) {
        if (state is ForgetPasswordSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ResetPasswordOTPScreen(email: emailController.text),
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
}
