import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> initShardPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}
