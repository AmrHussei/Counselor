import 'package:dio/dio.dart';
import '../models/dictionary_model.dart';
import '../services/dictionary_services.dart';

class DictionaryRepo {
  static Future<List<DictionaryModel>> getDictionaryData() async {
    Response response = await DictionaryServices.getDictionaryData();

    print('this is getSpecificQustions respons $response');
    List allCriminalDictionary = response.data['AllCriminalDictionary'];
    return allCriminalDictionary
        .map((data) => DictionaryModel.fromJson(data))
        .toList();
  }
}
