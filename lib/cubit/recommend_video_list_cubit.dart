import 'package:bilibili_flutter/data/model/bilibili/recommend_video.dart';
import 'package:bilibili_flutter/data/repository/bilibili.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedVideoListCubit extends Cubit<List<RecommendVideo>> {
  RecommendedVideoListCubit({required this.repository}) : super([]);

  final BilibiliRepository repository;

  void loadRecommendVideoList(int pageNum, int pageSize) {
    repository
        .fetchRecommendedVideos(pageNum, pageSize)
        .then((recommendVideoList) {
      emit(recommendVideoList);
    });
  }
}
