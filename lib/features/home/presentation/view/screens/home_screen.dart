import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_advice_app/features/news%20_and_videos/presentation/view_model/videos_cubit/videos_cubit.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../../../appointment_booking/presentation/view/screens/appointment_booking_screen.dart';
import '../../../../news _and_videos/presentation/view_model/news_cubit/news_cubit.dart';
import '../widgets/build_News_widgets.dart';
import '../widgets/build_intro_button_to_booking_and_consultation.dart';
import '../widgets/build_videos_widgets.dart';
import '../widgets/description_about_me_widget.dart';
import '../widgets/dictionary_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<NewsCubit>(context).getAllNews();
    BlocProvider.of<VideosCubit>(context).getAllVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 32.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BuildIntroButtonToBookingAndConsultation(
              image: AssetsData.bookingPNG2,
              mainText: 'حجز موعد في المكتب',
              subText: 'لطلب استشارات قانونية وطرح \nاسئلة في موضع معين',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        AppointmentBookingScreen(showAppBar: true),
                  ),
                );
              },
            )
                .animate()
                .fade(duration: 500.milliseconds)
                .slide(curve: Curves.easeIn),
            BuildIntroButtonToBookingAndConsultation(
              image: AssetsData.consultionPng,
              mainText: ' طلب استشارة قانونية',
              subText: 'لطلب استشارات قانونية وطرح \nاسئلة في موضع معين',
              onTap: () {},
            )
                .animate()
                .fade(duration: 500.milliseconds)
                .slide(curve: Curves.easeIn),
          ],
        ),
        const DescriptionAboutMeWidget()
            .animate()
            .fade(duration: 500.milliseconds)
            .slideX(),
        const BuildVideosWidgets()
            .animate()
            .fade(duration: 600.milliseconds)
            .slideX(),
        const BuildNewsWidgets()
            .animate()
            .fade(duration: 700.milliseconds)
            .slideX(),
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 23.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextUtils(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    text: 'القاموس القانوني',
                  )
                      .animate()
                      .fade(duration: 400.milliseconds)
                      .slideY(end: 0, begin: 1),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              const DictionaryWidget()
                  .animate()
                  .fade(duration: 600.milliseconds)
                  .slideY(end: 0, begin: 1),
            ],
          ),
        )
      ],
    );
  }
}
