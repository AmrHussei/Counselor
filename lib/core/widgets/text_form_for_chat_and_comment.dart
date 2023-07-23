import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/core/widgets/text_utils.dart';

import '../utils/assets_data.dart';
import '../utils/constant.dart';

class TextFormForChatAndComment extends StatelessWidget {
  const TextFormForChatAndComment({
    super.key,
    required this.messageController,
    required this.hintText,
    required this.buttonText,
    required this.onTap,
  });

  final TextEditingController messageController;
  final String hintText;
  final String buttonText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          Expanded(
            child: TextFormField(
              textAlign: TextAlign.right,
              controller: messageController,
              obscureText: false,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              validator: (value) {},
              style: GoogleFonts.tajawal(color: Colors.black),
              decoration: InputDecoration(
                fillColor: MyColors.authTextFormFiled,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 4.h, vertical: 17.h),
                filled: true,
                prefixIcon: SizedBox(),
                suffixIconConstraints: BoxConstraints(
                    maxWidth: 36.w,
                    maxHeight: 36.w,
                    minHeight: 24.w,
                    minWidth: 24.w),
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 0, 12.w, 0),
                  child: SizedBox(height: 24.w, width: 24.w, child: SizedBox()),
                ),
                hintText: hintText,
                hintStyle: GoogleFonts.almarai(
                  color: MyColors.descriptionText,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                  borderSide: BorderSide(color: MyColors.pink),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                  borderSide: BorderSide(color: MyColors.primary),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                  borderSide: BorderSide(color: MyColors.primary),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 47.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Column(
                  children: [
                    Image.asset(AssetsData.sendMsg),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextUtils(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      text: buttonText,
                      color: Colors.white,
                    )
                  ],
                ),
              )),
            ),
          )
        ]),
      ),
    );
  }
}
