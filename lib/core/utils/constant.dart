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
  static String deleteMe = 'user/deleteMe';
  static String orders = 'orders';
  static String videos = 'videos';
  static String criminalDictionary = 'criminalDictionary';
  static String posts = 'posts';
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

String nnnnnn =
    '''إن هذا الكتاب حسن الطوية فهو ينبهك منذ البداية إني لا أستهدف من ورائه مقصداً إلا ما ينفع العام والخاص، ولم أرد به خدمتك أو إعلاء ذكرى فإن مواهبي تعجز عن تحقيق مثل هذه الغاية... لقد خصصته لمنفعة الخاصة من أهلي وأصدقائي حتى إذا ما افتقدوني استطاعوا أن يجدوا فيه صورة لطباعي وميولي، فيسترجعوا ذكراي التي خلفتها لهم حيّة كاملة ولو كان هدفي أن أظفر بإعجاب العالم لعملت على إطراء نفسي وإظهارها بطريقة منمّقة ولكني أريد أن أعرف في أبسط صوري الطبيعية العادية دون تكلف ولا تصنع لأني أنا الذي أصوّر نفسي لهذا تبرز مساوئي واضحة وسجيتي على طبيعتها ما سمح لي العرف بذلك...»
يتضح في مقدمة كتاب ابن الجوزي صيد الخاطر إنما كتب هذه الفصول ليسجّل فيها خواطره التي أثارتها تجاربه وعلاقاته مع الأشياء. وهذه الخواطر ليست وليدة البحث والدرس العميق وإنما هي خواطر آنية تولد وتزول سريعاً إنْ لم تُدوّن لهذا سعى إلى تدوينها في هذا الكتاب وسمّاه (صيد الخاطر) كما سمّى فيما بعد أحمد أمين أشهر كتاب في المقالة الأدبية في الأدب العربي الحديث (فيض الخاطر) وهذا يعني أنَّ مفهوم ابن الجوزي لفصول كتابه قريب من مفهوم مونتاني لفصوله فهو جسّد فيها خواطره معلّقاً على هذا القول أو ذاك ومصوراً تجارب نفسه وعيوبها وما توصل إليه من أفكار تتعلق بالدين والحياة والمجتمع.

يقول ابن الجوزي في مقدمة (صيد الخاطر):

«. لَمّا كانت الخواطر تجول في تصفح أشياء تعرض لها، ثم تعرض عنها فتذهب، كان من أولى الأمور حفظ ما يخطر لكي لا ينسى، وقد قال عليه الصلاة والسلام: "قيِّدوا العلم بالكتابة". وكم خطر لي شيء فأتشاغل عن إثباته فيذهب، فأتأسف عليه ورأيت في نفسي إنني كلما فتحت بصر التفكر، سنح له من عجائب الغيب ما لم يكن في حساب فانثال عليه من كثيب التفهيم ما لا يجوز التفريط فيه فجعلت هذا الكتاب قيداً –لصيد الخاطر- والله وليّ النفع، إنه قريب مجيب»
''';
