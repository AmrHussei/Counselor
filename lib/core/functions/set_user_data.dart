import 'package:legal_advice_app/core/functions/init_shard_prefs.dart';
import '../../features/authentication/data/models/auth_model.dart';

setUserData(AuthlModel userData) async {
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
