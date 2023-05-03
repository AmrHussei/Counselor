import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../../data/models/news_model.dart';
import '../../view_model/news_cubit/news_cubit.dart';

class SingleNewsScreen extends StatelessWidget {
  const SingleNewsScreen({super.key, required this.singlenews});
  final NewsModel singlenews;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تفاصيل الخبر'),
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
        body: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 209.h,
                  width: double.infinity,
                  child: Image(
                    image: NetworkImage(
                      singlenews.image,
                    ), //todo: add portrait image
                    fit: BoxFit.fill,
                    errorBuilder: (_, __, ___) {
                      return Center(
                        child: Icon(
                          Icons.broken_image_sharp,
                          color: Colors.blueGrey,
                          size: 60.sp,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.w, 0, 3.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextUtils(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        text: singlenews.title,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        singlenews.desc,
                        style: GoogleFonts.almarai(
                          color: MyColors.descriptionText,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
