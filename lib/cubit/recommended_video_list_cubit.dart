import 'package:bilibili_flutter/data/model/bilibili/recommended_video.dart';
import 'package:bilibili_flutter/data/repository/bilibili.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedVideoListCubit extends Cubit<List<RecommendedVideo>> {
  RecommendedVideoListCubit({required this.repository}) : super([]);

  final BilibiliRepository repository;

  void loadRecommendedVideoList() {
    repository.fetchRecommendedVideos().then((recommendedVideoList) {
      emit(recommendedVideoList);
    });
  }
}
