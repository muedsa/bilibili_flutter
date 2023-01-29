import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:bilibili_flutter/widgets/adaptive_player.dart';

class BilibiliVideoPlayerPage extends StatefulWidget {
  static const String routeName = 'bilibiliVideoPlayer';

  const BilibiliVideoPlayerPage({required this.bv, super.key});

  final String bv;

  @override
  State<StatefulWidget> createState() => _BilibiliVideoPlayerPageState();
}

class _BilibiliVideoPlayerPageState extends State<BilibiliVideoPlayerPage> {
  late final AdaptivePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AdaptivePlayerController(
        title: widget.bv,
        subTitle: widget.bv,
        mediaUrl: 'https://work.muedsa.com/bilibili/dash/${widget.bv}.mbp',
        httpHeaders: <String, String>{
          'referer': 'https://www.bilibili.com/video/${widget.bv}'
        },
        formatHint: VideoFormat.dash);
    _controller.initialize().then((_) {
      setState(() {});
      _controller.play();
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
