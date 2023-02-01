import 'package:bilibili_flutter/data/model/bilibili/bilibili_response.dart';
import 'package:bilibili_flutter/data/model/bilibili/video_play_url_info.dart';
import 'package:bilibili_flutter/data/repository/bilibili.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoPlayUrlInfoCubit extends Cubit<BiliBiliResponse<VideoPlayUrlInfo>?> {
  VideoPlayUrlInfoCubit({required this.repository}) : super(null);

  final BilibiliRepository repository;

  void loadRecommendedVideoList(String bv, int cid) {
    repository.fetchVideoPlayUrlInfo(bv, cid).then((response) {
      emit(response);
    });
  }
}
