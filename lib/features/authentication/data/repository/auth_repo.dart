import 'package:dio/dio.dart';

import '../models/auth_model.dart';
import '../services/auth_services.dart';

class AuthRepo {
  static Future<AuthlModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    Response respons = await SignUpServices.signUp(
        email: email, password: password, name: name);
    print('this is sinUp respons ++++++++++++++++++++++');
    print(respons.toString());
    AuthlModel userData = AuthlModel.fromJson(respons.data);
    return userData;
  }

  //login
  static Future<AuthlModel> logIn({
    required String password,
    required String email,
  }) async {
    Response respons =
        await SignUpServices.logIn(email: email, password: password);
    print('this is Login respons ++++++++++++++++++++++');
    print(respons.toString());
    AuthlModel userData = AuthlModel.fromJson(respons.data);
    return userData;
  }

  //forgetPasswordFirstRequest
  static Future<Response> forgetPasswordFirstRequest({
    required String email,
  }) async {
    Response respons = await SignUpServices.forgetPasswordFirstRequest(
      email: email,
    );
    print('this is forgetPasswordFirstRequest respons ++++++++++++++++++++++');
    print(respons.toString());

    return respons;
  }

//varifyResetCodeForForgetPassword Request 2
  static Future<Response> varifyResetCodeForForgetPassword({
    required String resetCode,
    required String email,
  }) async {
    Response respons = await SignUpServices.varifyResetCodeForForgetPassword(
      email: email,
      resetCode: resetCode,
    );
    print(
        'this is varifyResetCodeForForgetPassword respons ++++++++++++++++++++++');
    print(respons.toString());
    return respons;
  }

//resetPasswordThree
  static Future<AuthlModel> resetPasswordThree({
    required String newPassword,
    required String email,
  }) async {
    Response respons = await SignUpServices.resetPasswordThree(
      email: email,
      newPassword: newPassword,
    );
    print('this is Login respons ++++++++++++++++++++++');
    print(respons.toString());
    AuthlModel userData = AuthlModel.fromJson(respons.data);
    return userData;
  }

  static Future<Response> deletUser() async {
    Response response = await SignUpServices.deletUser();

    return response;
  }
}
