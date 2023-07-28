import 'package:legal_advice_app/core/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> deletUserData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', '');
  await prefs.setString('name', '');
  await prefs.setString('email', '');
  await prefs.setString('id', '');

  UserDataConstant.token = '';
  UserDataConstant.name = '';
  UserDataConstant.email = '';
  UserDataConstant.id = '';
  print(' This is user data =============================================');
  print(
    '${UserDataConstant.token},,,${UserDataConstant.email},,,${UserDataConstant.id},,,${UserDataConstant.name}',
  );
}
