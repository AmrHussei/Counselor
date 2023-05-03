import 'package:dio/dio.dart';

import '../models/news_model.dart';
import '../services/news_services.dart';

class NewsRepo {
  static Future<List<NewsModel>> getAllNews() async {
    Response response = await NewsServices.getAllNews();

    print('this is allPosts respons $response');
    List allNews = response.data['allNews'];
    return allNews.map((news) => NewsModel.fromJson(news)).toList();
  }
}
