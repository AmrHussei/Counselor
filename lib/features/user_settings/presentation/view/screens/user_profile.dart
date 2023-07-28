import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../widgets/user_ProfileImage.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('حسابي'),
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
        body: Stack(
          children: [
            SizedBox(
              height: 152.h,
              width: double.infinity,
              child: Image.asset(
                AssetsData.profileBG,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15.w, 100.h, 15.w, 0),
                  child: const UserProfileImage(),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      text: UserDataConstant.name,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 275.h, 15.w, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(
                      thickness: 2.h,
                      color: MyColors.borders,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
