import 'package:bloc/bloc.dart';
import 'package:legal_advice_app/features/news%20_and_videos/data/repository/videos_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/models/videos_model.dart';

part 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  VideosCubit() : super(VideosInitial());

  late List<VideosModel> listOfAllVideos;

  Future<void> getAllVideos() async {
    try {
      emit(AllVideosLoading());
      listOfAllVideos = await VideosRepo.getAllVideos();
      emit(AllVideosLoaded());
    } catch (error) {
      emit(AllVideosError());
      print('********************Error AllVideosError cubit ');
      print(error.toString());
    }
  }
}
