import 'dart:io';

import 'package:bilibili_flutter/data/model/video_media_info.dart';
import 'package:bilibili_flutter/widgets/adaptive_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BilibiliVideoPlayerPage extends StatefulWidget {
  static const String routeName = 'bilibiliVideoPlayer';

  const BilibiliVideoPlayerPage({required this.videoMediaInfo, super.key});

  final VideoMediaInfo videoMediaInfo;

  @override
  State<StatefulWidget> createState() => _BilibiliVideoPlayerPageState();
}

class _BilibiliVideoPlayerPageState extends State<BilibiliVideoPlayerPage> {
  late final AdaptivePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AdaptivePlayerController(
        title: widget.videoMediaInfo.title,
        subTitle: widget.videoMediaInfo.subtitle,
        mediaUrl: widget.videoMediaInfo.mediaUrl,
        httpHeaders: widget.videoMediaInfo.mediaHttpHeaders,
        formatHint: VideoFormat.dash);
    _controller.initialize().then((_) {
      _controller.play();
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {});
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
