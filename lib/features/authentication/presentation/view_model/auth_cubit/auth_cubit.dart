import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/auth_model.dart';
import '../../../data/repository/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  late AuthlModel userData;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      emit(SignUpLoading());
      userData =
          await AuthRepo.signUp(name: name, email: email, password: password);
      emit(SignUpSuccess());
      await setUserData();
    } catch (error) {
      emit(SignUpError());
      print('SignUp SignUpError *****************************');
      print(error.toString());
    }
  }

  ///*****************************************************************

  Future<void> logIn({
    required String password,
    required String email,
  }) async {
    try {
      emit(LogInLoading());
      userData = await AuthRepo.logIn(email: email, password: password);
      emit(LogInSuccess());
      await setUserData();
    } catch (error) {
      emit(LogInError());
      print(' Log in Error *****************************');
      print(error.toString());
    }
  }

  ///***************************************************************** */
  //forgetPasswordFirstRequest
  Future<void> forgetPasswordFirstRequest({
    required String email,
  }) async {
    try {
      emit(ForgetPasswordLoading());
      await AuthRepo.forgetPasswordFirstRequest(email: email);
      emit(ForgetPasswordSuccess());
    } catch (error) {
      emit(ForgetPasswordError());
      print(' forgetPasswordFirstRequest *****************************');
      print(error.toString());
    }
  }

  Future<void> resendOTPCodeForForgetPassword({
    required String email,
  }) async {
    try {
      await AuthRepo.forgetPasswordFirstRequest(email: email);
      emit(ResendOTPCodeForForgetPasswordSucces());
    } catch (error) {
      emit(ResendOTPCodeForForgetPasswordError());
      print(' forgetPasswordFirstRequest *****************************');
      print(error.toString());
    }
  }

  Future<void> varifyResetCodeForForgetPassword({
    required String resetCode,
    required String email,
  }) async {
    try {
      emit(VarifyResetCodeForForgetPasswordLoading());
      await AuthRepo.varifyResetCodeForForgetPassword(
        email: email,
        resetCode: resetCode,
      );
      emit(VarifyResetCodeForForgetPasswordSuccess());
    } catch (error) {
      emit(VarifyResetCodeForForgetPasswordError());
      print(' varifyResetCodeForSignup Error *****************************');
      print(error.toString());
    }
  }

//resetPasswordThree
  Future<void> resetPasswordThree({
    required String newPassword,
    required String email,
  }) async {
    try {
      emit(ResetPasswordThreeLoading());
      userData = await AuthRepo.resetPasswordThree(
        email: email,
        newPassword: newPassword,
      );
      emit(ResetPasswordThreeSuccess());
      await setUserData();
    } catch (error) {
      emit(ResetPasswordThreeError());
      print(' Log in Error *****************************');
      print(error.toString());
    }
  }

  ///***************************************************************** */

  Future<SharedPreferences> initShardPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  setUserData() async {
    final prefs = await initShardPrefs();
    String token = userData.token;
    await prefs.setString('token', token);

    String email = userData.email;
    await prefs.setString('email', email);

    String id = userData.id;
    await prefs.setString('id', id);

    String name = userData.name;
    await prefs.setString('name', name);
  }
}
