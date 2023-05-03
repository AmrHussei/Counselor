import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import '../../../../../core/utils/constant.dart';
import '../../../data/models/posts_model.dart';
import '../../../data/repository/community_repo.dart';
part 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit() : super(CommunityInitial());

  late List<PostsModel> allPostsList;
  int page = 1;

  Future<void> getAllPosts() async {
    try {
      emit(AllPostsLoading());
      allPostsList = await CommunityRepo.getAllPosts();
      emit(AllPostsLoaded());
    } catch (error) {
      emit(AllPostsError());
      print('********************Error getAllPosts cubit ');
      print(error.toString());
    }
  }

  void loadMorePosts() async {
    page += 1;
    try {
      List<PostsModel> posts =
          await CommunityRepo.loadMorePosts(pageNum: page.toString());
      allPostsList.addAll(posts);
      emit(AllPostsLoaded());

      print('loadMorePhoto+++++++++++++++++++++++++++++++1');
    } catch (error) {
      emit(AllPostsError());
      print(error.toString());
    }
  }

  Future<void> postPosts({
    File? image,
  }) async {
    try {
      await CommunityRepo.postPosts(image: image);
      print('image uploaded ++++++++++++++++++++');
    } catch (error) {
      print('---------------------------------------------------');
      print(error.toString());
      return;
    }
  }

  Future<String> uploadImageToApi(
    File imageFile,
  ) async {
    var uri = Uri.parse(ApiConstant.posts);
    var request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer ${UserDataConstant.token}';

    var length = await imageFile.length();
    var stream = imageFile.openRead().cast<List<int>>();
    var multipartFile = http.MultipartFile('image', stream, length,
        filename: path.basename(imageFile.path));
    request.files.add(multipartFile);

    var response = await request.send();
    if (response.statusCode == 200) {
      print('succes uploade ********************');
      // If the server did return a 200 OK response,
      // then parse the JSON response.
      //emit(SuccesUploadFromGallery());
      String responseString =
          await response.stream.transform(utf8.decoder).join();
      return responseString;
    } else {
      //   emit(ErrorUploadFromGallery());
      print(' Eroor uploade  ********************');
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to upload image');
    }
  }

  // function to select image from gallery
  Future<File?> getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
