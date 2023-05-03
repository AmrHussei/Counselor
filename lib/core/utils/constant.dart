import 'package:flutter/material.dart';

class ApiConstant {
  static const String baseURL =
      'https://legal-advice-1812.onrender.com/api/v1/';
  static const String logInEndPoint = 'user/login';
  static String signUpEndpointOne = 'user/signup';
  static String forgetPasswordOne = 'user/forgetPassword';
  static String varifyResetCodeForPassword = 'user/verifyResetCode';
  static String resetPasswordthree = 'user/resetPassword';
  static String getAllTypesQustions = 'questions';
  static String getSpecificQustions = 'questions/';
  static String orders = 'orders';
  static String videos = 'videos';
  static String criminalDictionary = 'criminalDictionary';
  static String posts = 'https://legal-advice-1812.onrender.com/api/v1/posts';
}

class MyColors {
  static Color primary = const Color(0xffE1A553);
  static Color lightPrimary = const Color(0x40E1A553);
  static Color lightPrimary2 = const Color(0x0DE1A553);
  static Color greeylightBorders = const Color(0xffF2F2F2);
  static Color authTextFormFiled = const Color(0xffF4F3F3);
  static Color descriptionText = const Color(0xB3000000);
  static Color title = const Color(0xff141A34);
  static Color green = const Color(0xff31BD00);
  static Color pink = const Color(0xffFF395D);
  static Color scaffoldBackground = const Color(0xff1E1E1E);
  static const greyBorders = Color(0xff7D829E);
  static const borders = Color(0xffDBDBDB);
  static const dotsColor = Color(0xffEBEDEE);
  static const deepBlue = Color(0xff011C51);
  static const gradient2 = Color(0x997E5936);
  static const gradient1 = Color(0xffF5CB86);
}

class UserDataConstant {
  static String token = '';
  static String email = '';
  static String id = '';
  static String name = '';
}

class ManagerrDataConstant {
  static String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDNiNGI1MWYyNzBjNmQwMzc0N2FmZjAiLCJpYXQiOjE2ODE5NDY5NTAsImV4cCI6MTY4NDUzODk1MH0.MzirmfMEl8Dakg2ajOUVXaiiiUAQ13XOdQJiR4dB3Xo';
  List<String> majors = [];
}

String validationName = r'^[a-z A-Z]+$';

String validationEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
