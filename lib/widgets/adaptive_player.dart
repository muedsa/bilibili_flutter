import 'dart:io';
import 'package:bilibili_flutter/widgets/other_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:video_player/video_player.dart';
import 'package:bilibili_flutter/utils.dart';

class AdaptivePlayer extends StatefulWidget {
  const AdaptivePlayer(this.controller, {super.key});

  final AdaptivePlayerController controller;

  @override
  State<StatefulWidget> createState() => _AdaptivePlayer();
}

class _AdaptivePlayer extends State<AdaptivePlayer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late Widget w;
    if (widget.controller._type == AdaptivePlayerType.dartVlc) {
      w = Video(player: widget.controller._vlcPlayer, showControls: true);
    } else if (widget.controller._type == AdaptivePlayerType.videoPlayer) {
      w = widget.controller._videoPlayerController != null &&
              widget.controller._videoPlayerController!.value.isInitialized
          ? VideoPlayer(widget.controller._videoPlayerController!)
          : MessageWidget.loading;
    } else {
      w = MessageWidget.unsupported;
    }
    return w;
  }
}

enum AdaptivePlayerType { unsupported, dartVlc, videoPlayer }

class AdaptivePlayerController extends ValueNotifier<VideoPlayerValue> {
  AdaptivePlayerController({
    required this.mediaUrl,
    this.httpHeaders = const <String, String>{},
    this.formatHint,
  }) : super(VideoPlayerValue(duration: Duration.zero));

  final String mediaUrl;
  final Map<String, String> httpHeaders;
  final VideoFormat? formatHint;

  late final AdaptivePlayerType _type;
  Player? _vlcPlayer;
  VideoPlayerController? _videoPlayerController;

  Future<void> initialize() async {
    if (kIsWeb) {
      _type = AdaptivePlayerType.videoPlayer;
    } else {
      if (Platform.isIOS || Platform.isAndroid || Platform.isFuchsia) {
        _type = AdaptivePlayerType.videoPlayer;
      } else if (Platform.isWindows || Platform.isLinux) {
        _type = AdaptivePlayerType.dartVlc;
      } else {
        _type = AdaptivePlayerType.unsupported;
      }
    }
    if (_type == AdaptivePlayerType.dartVlc) {
      _vlcPlayer = Player(id: 23333, commandlineArguments: [
        '--http-referrer=${HttpHeaderUtils.getValue(httpHeaders, HttpHeaderUtils.referrer)}'
      ]);
      _vlcPlayer?.open(Media.network(mediaUrl, parse: true));
      return;
    } else if (_type == AdaptivePlayerType.videoPlayer) {
      _videoPlayerController = VideoPlayerController.network(mediaUrl,
          formatHint: formatHint, httpHeaders: httpHeaders);
      return _videoPlayerController?.initialize();
    }
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    if (_type == AdaptivePlayerType.dartVlc) {
      _vlcPlayer?.dispose();
    } else if (_type == AdaptivePlayerType.videoPlayer) {
      _videoPlayerController?.dispose();
    }
  }

  Future<void> play() async {
    if (_type == AdaptivePlayerType.dartVlc) {
      _vlcPlayer?.play();
    } else if (_type == AdaptivePlayerType.videoPlayer) {
      _videoPlayerController?.play();
    }
  }

}
