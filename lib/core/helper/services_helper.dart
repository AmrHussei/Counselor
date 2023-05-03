import 'dart:io';

import 'package:dio/dio.dart';

import '../utils/constant.dart';

class ServicesHelper {
  static late Dio dio;
  static intiDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      url,
      data: data,
    );
  }

  static Future<Response> postDataWithToken({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      url,
      data: data,
      options: Options(
        headers: {'Authorization': 'Bearer ${UserDataConstant.token}'},
      ),
    );
  }

  static Future<Response> postImageAndPost({
    required String url,
    Map<String, dynamic>? data,
    File? image,
  }) async {
    FormData formData = FormData.fromMap({
      if (data != null) ...data,
      if (image != null)
        'image': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
    });

    return await dio.post(
      url,
      data: formData,
      options: Options(
        headers: {'Authorization': 'Bearer ${UserDataConstant.token}'},
      ),
    );
  }

  static Future<Response> getData({
    required String url,
  }) async {
    return await dio.get(
      url,
      options: Options(
        headers: {'Authorization': 'Bearer ${ManagerrDataConstant.token}'},
      ),
    );
  }

  static Future<Response> getDataWithoutToken({
    required String url,
  }) async {
    return await dio.get(
      url,
    );
  }
}
