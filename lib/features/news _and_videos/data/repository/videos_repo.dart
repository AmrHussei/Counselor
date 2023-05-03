import 'package:dio/dio.dart';

import '../models/news_model.dart';
import '../models/videos_model.dart';
import '../services/news_services.dart';
import '../services/videos_services.dart';

class VideosRepo {
  static Future<List<VideosModel>> getAllVideos() async {
    Response response = await VideosServices.getAllVideos();

    print('this is videos respons $response');
    List videos = response.data['videos'];
    return videos.map((video) => VideosModel.fromJson(video)).toList();
  }
}
