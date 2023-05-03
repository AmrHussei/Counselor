import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../widgets/manager_profile_widgets/contact_details_and_profile_image.dart';
import '../widgets/manager_profile_widgets/experiences_widgets.dart';
import '../widgets/manager_profile_widgets/majors_widgets.dart';
import '../widgets/manager_profile_widgets/my_container_with_title.dart';
import '../widgets/manager_profile_widgets/qualifications_widgets.dart';

class ManagerProfile extends StatelessWidget {
  const ManagerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('محامي ومدير التطبيق'),
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
                  child: const ContactDetailsAndProfileImage(),
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
                      text: 'المستشار عمرو',
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
                    MyContainerWithTitle(
                      title: 'نبذه عني',
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 15.h),
                            child: Text(
                              'يعد المحامون في مصر مسؤولين عن تمثيل الموكلين في القضايا القانونية والدفاع عن حقوقهم في المحاكم. يجب على المحامين في مصر إتمام دراسة الحقوق وتلقي التدريب اللازم للحصول على شهادة المحاماة.',
                              style: GoogleFonts.almarai(
                                fontSize: 14.sp,
                                height: 2,
                                fontWeight: FontWeight.w300,
                                color: MyColors.descriptionText,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const MajorsWidgets(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const ExperiencesWidgets(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const QualificationsWidgets(),
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
