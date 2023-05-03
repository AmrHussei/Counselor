import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_advice_app/features/appointment_booking/presentation/view/widgets/my_text_form_filed.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/submited_button.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../view_model/booking_cubit/booking_cubit.dart';
import '../widgets/child_of_booking_submited_button.dart';

class AppointmentBookingScreen extends StatelessWidget {
  AppointmentBookingScreen({super.key});

  final TextEditingController reasonController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('طلب موعد مع المكتب'),
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
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 31.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyTextFormFiled(
                    maxLines: 1,
                    controller: reasonController,
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value.toString().length < 5) {
                        return 'يجب ادخال سبب الموعد';
                      } else {
                        return null;
                      }
                    },
                    headerText: 'سبب الموعد',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextFormFiled(
                    maxLines: 5,
                    controller: detailsController,
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value.toString().length < 30) {
                        return 'يجب ادخال وصف اكثر من 30 حرف';
                      } else {
                        return null;
                      }
                    },
                    headerText: 'التفاصيل',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextFormFiled(
                    maxLines: 1,
                    controller: dateController,
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value.toString().length < 4) {
                        return 'حدد الموعد من فضلك';
                      } else {
                        return null;
                      }
                    },
                    headerText: 'التاريخ',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextFormFiled(
                    maxLines: 1,
                    controller: phoneNumController,
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (value.toString().length < 6) {
                        return 'برجاء ادخال رقم مصري صحيح';
                      } else {
                        return null;
                      }
                    },
                    headerText: 'رقم الهاتف',
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  SubmitedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<BookingCubit>(context).postOrder(
                            date: dateController.text,
                            phone: phoneNumController.text,
                            desc: detailsController.text,
                            reason: reasonController.text);
                      }
                    },
                    child: const ChildOfBookingSubmitedButton(),
                  ),
                  bookingBloc()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bookingBloc() {
    return BlocListener<BookingCubit, BookingState>(
      listenWhen: ((previous, current) => previous != current),
      listener: ((context, state) {
        if (state is BookingError) {
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
        if (state is BookingSuccess) {
          reasonController.clear();
          dateController.clear();
          phoneNumController.clear();
          detailsController.clear();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: TextUtils(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                text: 'تم حجز موعد بنجاح',
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
