part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpError extends AuthState {}

class ThisEmailIsLoged extends AuthState {}

// verify sign up
class VerifySignUpLoading extends AuthState {}

class VerifySignUpError extends AuthState {}

class VerifySignUpSuccess extends AuthState {}

///LogIn
class LogInSuccess extends AuthState {}

class LogInError extends AuthState {}

class LogInLoading extends AuthState {}

//ForgetPassword
class ForgetPasswordLoading extends AuthState {}

class ForgetPasswordSuccess extends AuthState {}

class ForgetPasswordError extends AuthState {}

//VarifyResetCodeForForgetPassword
class VarifyResetCodeForForgetPasswordSuccess extends AuthState {}

class VarifyResetCodeForForgetPasswordLoading extends AuthState {}

class VarifyResetCodeForForgetPasswordError extends AuthState {}

//resetPasswordThree
class ResetPasswordThreeSuccess extends AuthState {}

class ResetPasswordThreeError extends AuthState {}

class ResetPasswordThreeLoading extends AuthState {}

//resendOTPCodeForForgetPassword
class ResendOTPCodeForForgetPasswordSucces extends AuthState {}

class ResendOTPCodeForForgetPasswordError extends AuthState {}
