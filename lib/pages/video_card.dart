import 'package:bilibili_flutter/data/convert/video_convert.dart';
import 'package:bilibili_flutter/data/model/bilibili/danmaku/danmaku.pb.dart';
import 'package:bilibili_flutter/data/model/video_play_info.dart';
import 'package:bilibili_flutter/data/repository/bilibili.dart';
import 'package:bilibili_flutter/pages/player_page.dart';
import 'package:bilibili_flutter/utils.dart';
import 'package:bilibili_flutter/widgets/adaptive_player.dart';
import 'package:bilibili_flutter/widgets/card.dart';
import 'package:bilibili_flutter/widgets/d_pad_control_focus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulWidget {
  static const double coverAspectRatio = 16.0 / 9.0;

  const VideoCard({
    required this.bv,
    required this.cid,
    required this.coverUrl,
    required this.danmakuSegmentSize,
    required this.title,
    this.titleStyle,
    required this.author,
    this.authorStyle,
    required this.textBoxHeight,
    this.color,
    this.focusedColor,
    super.key,
  });

  final String bv;
  final int cid;
  final String coverUrl;
  final int danmakuSegmentSize;
  final String title;
  final TextStyle? titleStyle;
  final String author;
  final TextStyle? authorStyle;
  final double textBoxHeight;
  final Color? color;
  final Color? focusedColor;

  @override
  State<StatefulWidget> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    Color color = widget.color ?? Colors.transparent;
    Color focusedColor = widget.focusedColor ?? Theme.of(context).focusColor;
    return SimpleDPadFocusTap(
        onFocusChange: (hasFocused) {
          setState(() {
            focused = hasFocused;
          });
        },
        onTap: () {
          BilibiliRepository repository =
              RepositoryProvider.of<BilibiliRepository>(context);
          next(String mediaUrl, VideoFormat videoFormat,
              List<DanmakuElem> danmakuList) {
            Navigator.pushNamed(context, BilibiliVideoPlayerPage.routeName,
                arguments: VideoPlayInfo(
                  title: widget.title,
                  subtitle: widget.author,
                  mediaUrl: mediaUrl,
                  mediaFormat: videoFormat,
                  mediaHttpHeaders: <String, String>{
                    HttpHeaderUtils.refererUppercase:
                        'https://www.bilibili.com/video/${widget.bv}',
                    HttpHeaderUtils.userAgentUppercase:
                        HttpHeaderUtils.chromeUserAgent,
                  },
                  danmakuList: danmakuList,
                ));
          }

          if (AdaptivePlayerController.type == AdaptivePlayerType.dartVlc) {
            repository
                .getVideoPlayUrlAndDanmakuInfo(
                    widget.bv, widget.cid, widget.danmakuSegmentSize)
                .then((m) {
              if (m.success &&
                  m.data != null &&
                  m.data!.playUrlInfo.dash.video.isNotEmpty) {
                next(m.data!.playUrlInfo.dash.video[0].baseUrl,
                    VideoFormat.other, m.data!.danmakuList);
              }
            });
          } else {
            repository
                .fetchVideoDanmakuElem(widget.cid, widget.danmakuSegmentSize)
                .then((danmakuList) => next(
                    VideoConvert.getDashMediaUrl(widget.bv, widget.cid),
                    VideoFormat.dash,
                    danmakuList));
          }
        },
        child: SimpleImageCard(
          imageUrl: widget.coverUrl,
          imageAspectRatio: VideoCard.coverAspectRatio,
          textTitle: widget.title,
          titleStyle: widget.titleStyle,
          textContent: widget.author,
          contentStyle: widget.authorStyle,
          textBoxHeight: widget.textBoxHeight,
          backgroundColor: focused ? focusedColor : color,
        ));
  }
}
