import 'dart:io';
import 'package:dio/dio.dart';

import '../../../questions_and_dictionary/data/services/questions_services.dart';
import '../models/posts_model.dart';
import '../services/community_services.dart';

class CommunityRepo {
  static Future<dynamic> postPosts({
    File? image,
  }) async {
    try {
      return CommunityServices.postPosts(image: image);
    } catch (error) {
      print('---------------------------------------------------');
      print(error.toString());
      return;
    }
  }

  static Future<List<PostsModel>> loadMorePosts({String pageNum = '1'}) async {
    try {
      List posts = await CommunityServices.getAllPosts(pageNum: pageNum);
      return posts.map((post) => PostsModel.fromJson(post)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<List<PostsModel>> getAllPosts() async {
    Response response = await CommunityServices.getAllPosts();

    print('this is allPosts respons $response');
    List allPosts = response.data['allPosts'];
    return allPosts.map((posts) => PostsModel.fromJson(posts)).toList();
  }
}
