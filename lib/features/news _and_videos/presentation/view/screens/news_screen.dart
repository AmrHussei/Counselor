import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../view_model/news_cubit/news_cubit.dart';
import '../widgets/body_of_news_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  void requestPermissionsForNotifications() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: true,
      criticalAlert: false,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('authorized');
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          'title ${message.notification!.title} body ${message.notification!.body}');
    });
  }

  @override
  void initState() {
    requestPermissionsForNotifications();
    BlocProvider.of<NewsCubit>(context).getAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الأخبار والتحديثات'),
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
        body: const BodyOfNewsScreen(),
      ),
    );
  }
}
