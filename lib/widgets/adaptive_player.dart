import 'dart:io';
import 'package:bilibili_flutter/widgets/other_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:video_player/video_player.dart';
import 'package:bilibili_flutter/utils.dart';

import 'd_pad_control_focus.dart';

class AdaptivePlayer extends StatefulWidget {
  const AdaptivePlayer(this.controller, {super.key});

  final AdaptivePlayerController controller;

  @override
  State<StatefulWidget> createState() => _AdaptivePlayer();
}

class _AdaptivePlayer extends State<AdaptivePlayer> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget w;
    if (widget.controller.type == AdaptivePlayerType.dartVlc) {
      w = Video(player: widget.controller._vlcPlayer, showControls: true);
    } else if (widget.controller.type == AdaptivePlayerType.videoPlayer) {
      w = widget.controller._videoPlayerController != null &&
              widget.controller._videoPlayerController!.value.isInitialized
          ? SimpleDPadFocusTap(
              focusNode: _focusNode,
              onTap: () {
                Navigator.of(context)
                    .push(PlayerControllerPopupRoute(widget.controller));
              },
              onDPadKey: (key, count) {
                if(key != DPadControlKey.select) {
                  Navigator.of(context)
                      .push(PlayerControllerPopupRoute(widget.controller));
                }
              },
              child: VideoPlayer(widget.controller._videoPlayerController!))
          : MessageWidget.loading;
    } else {
      w = MessageWidget.unsupported;
    }
    return w;
  }
}

enum AdaptivePlayerType { unsupported, dartVlc, videoPlayer }

class AdaptivePlayerController {
  AdaptivePlayerController({
    required this.mediaUrl,
    this.httpHeaders = const <String, String>{},
    this.formatHint,
    required this.title,
    required this.subTitle,
  }) : type = AdaptivePlayerType.unsupported;

  final String mediaUrl;
  final Map<String, String> httpHeaders;
  final VideoFormat? formatHint;
  final String title;
  final String subTitle;

  AdaptivePlayerType type;
  Player? _vlcPlayer;
  VideoPlayerController? _videoPlayerController;

  Future<void> initialize() async {
    debugPrint('player mediaUrl:$mediaUrl');
    if (kIsWeb) {
      type = AdaptivePlayerType.videoPlayer;
    } else {
      if (Platform.isIOS || Platform.isAndroid || Platform.isFuchsia) {
        type = AdaptivePlayerType.videoPlayer;
      } else if (Platform.isWindows || Platform.isLinux) {
        type = AdaptivePlayerType.dartVlc;
      }
    }
    if (type == AdaptivePlayerType.dartVlc) {
      _vlcPlayer = Player(id: 23333, commandlineArguments: [
        '--http-referrer=${HttpHeaderUtils.getValue(httpHeaders, HttpHeaderUtils.referrer)}'
      ]);
      _vlcPlayer?.open(Media.network(mediaUrl, parse: true));
    } else if (type == AdaptivePlayerType.videoPlayer) {
      _videoPlayerController = VideoPlayerController.network(mediaUrl,
          formatHint: formatHint, httpHeaders: httpHeaders);
      return _videoPlayerController?.initialize();
    }
    return;
  }

  Future<void> dispose() async {
    if (type == AdaptivePlayerType.dartVlc) {
      _vlcPlayer?.dispose();
    } else if (type == AdaptivePlayerType.videoPlayer) {
      _videoPlayerController?.dispose();
    }
  }

  Future<void> play() async {
    if (type == AdaptivePlayerType.dartVlc) {
      _vlcPlayer?.play();
    } else if (type == AdaptivePlayerType.videoPlayer) {
      _videoPlayerController?.play();
    }
  }

  Future<void> pause() async {
    if (type == AdaptivePlayerType.dartVlc) {
      _vlcPlayer?.pause();
    } else if (type == AdaptivePlayerType.videoPlayer) {
      _videoPlayerController?.pause();
    }
  }
}

class PlayerControllerPopupRoute extends PopupRoute<void> {
  PlayerControllerPopupRoute(this._controller);

  final AdaptivePlayerController _controller;

  @override
  Color? get barrierColor => Colors.black.withAlpha(0x50);

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'PlayerController';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Padding(
        padding: const EdgeInsets.all(40),
        child: Column(children: [
          Expanded(child: Container()),
          SizedBox(
            width: double.infinity,
            child: Text(
              _controller.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              _controller.subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Text('TODO 进度条'), // todo 进度条
          const Text('TODO 按钮组'), // todo 按钮组
        ]));
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
