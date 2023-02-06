import 'dart:io';

import 'package:bilibili_flutter/data/model/bilibili/danmaku/danmaku.pb.dart';
import 'package:bilibili_flutter/data/model/video_play_info.dart';
import 'package:bilibili_flutter/widgets/adaptive_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_danmaku/flutter_danmaku.dart';
import 'package:video_player/video_player.dart';

class BilibiliVideoPlayerPage extends StatefulWidget {
  static const String routeName = 'bilibiliVideoPlayer';

  const BilibiliVideoPlayerPage({required this.videoPlayInfo, super.key});

  final VideoPlayInfo videoPlayInfo;

  @override
  State<StatefulWidget> createState() => _BilibiliVideoPlayerPageState();
}

class _BilibiliVideoPlayerPageState extends State<BilibiliVideoPlayerPage> {
  late final AdaptivePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AdaptivePlayerController(
        title: widget.videoPlayInfo.title,
        subTitle: widget.videoPlayInfo.subtitle,
        mediaUrl: widget.videoPlayInfo.mediaUrl,
        httpHeaders: widget.videoPlayInfo.mediaHttpHeaders,
        formatHint: VideoFormat.dash,
        danmakuReadyCallback: () {
          for (DanmakuElem element in widget.videoPlayInfo.danmakuList) {
            //debugPrint(element.toDebugString());
            if (_controller
                    .addDanmaku(element.content,
                        color: Color(element.color),
                        offsetMS: -1 * element.progress)
                    .code ==
                AddBulletResCode.success) {
              debugPrint("success: ${element.content}, p:${element.progress}");
            } else {
              debugPrint("missing: ${element.content}, p:${element.progress}");
            }
          }
        });
    _controller.initialize().then((_) {
      _controller.play();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Platform.isLinux || Platform.isWindows ? AppBar() : null,
        body: SafeArea(child: AdaptivePlayer(_controller)));
  }
}
