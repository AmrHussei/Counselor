import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/helper/services_helper.dart';
import '../../../../core/utils/constant.dart';

class CommunityServices {
  static Future<dynamic> postPosts({
    File? image,
  }) async {
    try {
      Response response = await ServicesHelper.postImageAndPost(
          url: ApiConstant.posts, data: {'text': 'From amr'}, image: image);
      print('this is respons $response +++++++++++++++++++++++++++++');
      return response;
    } catch (error) {
      print('---------------------------------------------------');
      print(error.toString());
      return;
    }
  }

  static Future<dynamic> getAllPosts({String pageNum = '1'}) async {
    try {
      return await ServicesHelper.getData(url: 'posts?page=$pageNum');
    } catch (error) {
      print(
          '---------------------- error from getAllTypesOfQustions -----------------------------');
      print(error.toString());
      return;
    }
  }
}
