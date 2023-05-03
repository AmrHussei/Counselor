import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../data/models/news_model.dart';
import '../../../data/repository/news_repo.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  late List<NewsModel> listOfAllNews;

  Future<void> getAllNews() async {
    try {
      emit(AllNewsLoading());
      listOfAllNews = await NewsRepo.getAllNews();
      emit(AllNewsLoaded());
    } catch (error) {
      emit(AllNewsError());
      print('********************Error AllNewsError cubit ');
      print(error.toString());
    }
  }
}
