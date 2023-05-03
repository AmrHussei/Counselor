import '../../../../core/helper/services_helper.dart';
import '../../../../core/utils/constant.dart';

class SignUpServices {
  static Future<dynamic> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      return await ServicesHelper.postData(
        url: ApiConstant.signUpEndpointOne,
        data: {
          "email": email,
          "name": name,
          "password": password,
        },
      );
    } catch (error) {
      print('---------------------------------------------------');
      print(error.toString());
      return;
    }
  }

  static Future<dynamic> logIn({
    required String email,
    required String password,
  }) async {
    try {
      return await ServicesHelper.postData(
        url: ApiConstant.logInEndPoint,
        data: {
          "email": email,
          "password": password,
        },
      );
    } catch (error) {
      print('---------------------------------------------------');
      print(error.toString());
      return;
    }
  }

  static Future<dynamic> forgetPasswordFirstRequest({
    required String email,
  }) async {
    try {
      return await ServicesHelper.postData(
        url: ApiConstant.forgetPasswordOne,
        data: {
          "email": email,
        },
      );
    } catch (error) {
      print('---------------------------------------------------');
      print(error.toString());
      return;
    }
  }

  static Future<dynamic> varifyResetCodeForForgetPassword({
    required String resetCode,
    required String email,
  }) async {
    try {
      return await ServicesHelper.postData(
        url: ApiConstant.varifyResetCodeForPassword,
        data: {
          "resetCode": resetCode,
          "email": email,
        },
      );
    } catch (error) {
      print('---------------------------------------------------');
      print(error.toString());
      return;
    }
  }

  static Future<dynamic> resetPasswordThree({
    required String email,
    required String newPassword,
  }) async {
    try {
      return await ServicesHelper.postData(
        url: ApiConstant.resetPasswordthree,
        data: {
          "email": email,
          "newPassword": newPassword,
        },
      );
    } catch (error) {
      print('---------------------------------------------------');
      print(error.toString());
      return;
    }
  }
}
