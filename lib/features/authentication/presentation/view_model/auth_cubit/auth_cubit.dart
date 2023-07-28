import 'package:bloc/bloc.dart';
import 'package:legal_advice_app/core/functions/delet_user_data.dart';
import 'package:meta/meta.dart';
import '../../../../../core/functions/set_user_data.dart';
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
      await setUserData(userData);
    } catch (error) {
      emit(SignUpError());
      print('SignUp SignUpError *****************************');
      print(error.toString());
    }
  }

  Future<void> logIn({
    required String password,
    required String email,
  }) async {
    try {
      emit(LogInLoading());
      userData = await AuthRepo.logIn(email: email, password: password);
      emit(LogInSuccess());
      await setUserData(userData);
    } catch (error) {
      emit(LogInError());
      print(' Log in Error *****************************');
      print(error.toString());
    }
  }

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
      await setUserData(userData);
    } catch (error) {
      emit(ResetPasswordThreeError());
      print(' Log in Error *****************************');
      print(error.toString());
    }
  }

  Future deletUser() async {
    try {
      emit(DeletUsersLoading());
      await AuthRepo.deletUser();
      await deletUserData();
      emit(DeletUsersSuccess());
    } catch (error) {
      emit(DeletUsersError());
      print(error.toString());
    }
  }
}
