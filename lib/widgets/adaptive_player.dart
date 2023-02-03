import 'dart:async';
import 'dart:io';

import 'package:bilibili_flutter/utils.dart';
import 'package:bilibili_flutter/widgets/d_pad_control_focus.dart';
import 'package:bilibili_flutter/widgets/other_widget.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_danmaku/flutter_danmaku.dart';
import 'package:video_player/video_player.dart';

class AdaptivePlayer extends StatefulWidget {
  const AdaptivePlayer(this.controller, {super.key});

  final AdaptivePlayerController controller;

  @override
  State<StatefulWidget> createState() => _AdaptivePlayerState();
}

class _AdaptivePlayerState extends State<AdaptivePlayer> {
  late final FocusNode _focusNode;

  bool get ready =>
      (widget.controller._videoPlayerController != null &&
          widget.controller._videoPlayerController!.value.isInitialized) ||
      widget.controller._vlcPlayer != null;

  // 幕布尺寸
  Size get areaSize {
    Size size = MediaQuery.of(context).size;
    return Size(size.width, size.height);
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FocusScope.of(context).requestFocus(_focusNode);
      widget.controller._danmakuController.init(areaSize);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildPlayerControllerView(Stack(
      children: [_buildPlayerView(), _buildDanmakuView()],
    ));
  }

  Widget _buildPlayerView() {
    late Widget view;
    if (widget.controller.type == AdaptivePlayerType.videoPlayer) {
      view = Center(
          child: AspectRatio(
        aspectRatio:
            widget.controller._videoPlayerController!.value.aspectRatio,
        child: VideoPlayer(widget.controller._videoPlayerController!),
      ));
    } else if (widget.controller.type == AdaptivePlayerType.dartVlc) {
      view = Video(player: widget.controller._vlcPlayer, showControls: false);
    } else {
      view = MessageWidget.unsupported;
    }
    return view;
  }

  Widget _buildDanmakuView() {
    return FlutterDanmakuArea(controller: widget.controller._danmakuController);
  }

  Widget _buildPlayerControllerView(Widget child) {
    return SimpleDPadFocusTap(
        focusNode: _focusNode,
        onTap: () {
          Navigator.of(context)
              .push(PlayerControllerPopupRoute(widget.controller));
        },
        onDPadKey: (type, key, count) {
          if (type == DPadControlKeyEventType.up &&
              key != DPadControlKey.select) {
            Navigator.of(context)
                .push(PlayerControllerPopupRoute(widget.controller));
          }
        },
        child: child);
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
  final FlutterDanmakuController _danmakuController =
      FlutterDanmakuController();

  Future<void> initialize() async {
    debugPrint('player mediaUrl: $mediaUrl');
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
        '--http-referrer=${HttpHeaderUtils.getValue(httpHeaders, HttpHeaderUtils.referer)}',
      ]);
      _vlcPlayer?.setUserAgent(
          HttpHeaderUtils.getValue(httpHeaders, HttpHeaderUtils.userAgent) ??
              HttpHeaderUtils.chromeUserAgent);
      debugPrint(
          'vlc commandlineArguments: ${_vlcPlayer?.commandlineArguments.toString()}');
      _vlcPlayer?.open(Media.network(mediaUrl, parse: true), autoStart: true);
    } else if (type == AdaptivePlayerType.videoPlayer) {
      _videoPlayerController = VideoPlayerController.network(mediaUrl,
          formatHint: formatHint, httpHeaders: httpHeaders);
      await _videoPlayerController?.initialize();
    }
  }

  Future<void> dispose() async {
    if (type == AdaptivePlayerType.dartVlc) {
      _vlcPlayer?.dispose();
    } else if (type == AdaptivePlayerType.videoPlayer) {
      await _videoPlayerController?.dispose();
    }
    _danmakuController.dispose();
  }

  Future<void> play() async {
    if (type == AdaptivePlayerType.dartVlc) {
      _vlcPlayer?.play();
    } else if (type == AdaptivePlayerType.videoPlayer) {
      await _videoPlayerController?.play();
    }
    _danmakuController.play();
  }

  Future<void> pause() async {
    if (type == AdaptivePlayerType.dartVlc) {
      _vlcPlayer?.pause();
    } else if (type == AdaptivePlayerType.videoPlayer) {
      await _videoPlayerController?.pause();
    }
    _danmakuController.pause();
  }

  Future<void> seekTo(Duration position) async {
    if (type == AdaptivePlayerType.dartVlc) {
      _vlcPlayer?.seek(position);
    } else if (type == AdaptivePlayerType.videoPlayer) {
      await _videoPlayerController?.seekTo(position);
    }
    // todo _danmakuController seek
  }

  bool get isPlaying {
    if (type == AdaptivePlayerType.dartVlc) {
      return _vlcPlayer?.playback.isPlaying ?? false;
    } else if (type == AdaptivePlayerType.videoPlayer) {
      return _videoPlayerController?.value.isPlaying ?? false;
    }
    return false;
  }

  Future<Duration?> get position async {
    if (type == AdaptivePlayerType.dartVlc) {
      return _vlcPlayer?.position.position;
    } else if (type == AdaptivePlayerType.videoPlayer) {
      return _videoPlayerController?.position;
    }
    return null;
  }

  void addDanmaku(String text) {
    _danmakuController.addDanmaku(text);
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
          Expanded(
              child: Center(
            child: _AdaptivePlayerSimpleControlGroup(_controller),
          )),
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
          SizedBox(
              width: double.infinity,
              child: _AdaptivePlayerProgressBar(_controller)),
          Text('TODO 其他的按钮组',
              style: Theme.of(context).textTheme.titleMedium), // todo 其他的按钮组
        ]));
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}

class _AdaptivePlayerSimpleControlGroup extends StatefulWidget {
  const _AdaptivePlayerSimpleControlGroup(this._controller);

  final AdaptivePlayerController _controller;

  @override
  State<StatefulWidget> createState() =>
      _AdaptivePlayerSimpleControlGroupState();
}

class _AdaptivePlayerSimpleControlGroupState
    extends State<_AdaptivePlayerSimpleControlGroup> {
  bool _focused = false;

  bool _keyDowning = false;
  DPadControlKey? _downedKey;

  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDPadFocusTap(
        focusNode: _focusNode,
        onFocusChange: (hasFocus) {
          setState(() {
            _focused = hasFocus;
          });
        },
        onDPadKey: (type, key, count) {
          if (type == DPadControlKeyEventType.up) {
            if (key == DPadControlKey.left) {
              widget._controller.position.then((position) {
                if (position != null) {
                  widget._controller
                      .seekTo(position + const Duration(seconds: -10));
                }
              });
            } else if (key == DPadControlKey.right) {
              widget._controller.position.then((position) {
                if (position != null) {
                  widget._controller
                      .seekTo(position + const Duration(seconds: 10));
                }
              });
            } else if (key == DPadControlKey.select) {
              if (widget._controller.isPlaying) {
                widget._controller.pause().then((_) => setState(() {}));
              } else {
                widget._controller.play().then((_) => setState(() {}));
              }
            }
            setState(() {
              _downedKey = null;
              _keyDowning = false;
            });
          } else if (key == DPadControlKey.left ||
              key == DPadControlKey.right ||
              key == DPadControlKey.select) {
            setState(() {
              _downedKey = key;
              _keyDowning = true;
            });
          } else {
            setState(() {
              _downedKey = null;
              _keyDowning = false;
            });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_circle_left_rounded,
              color: _getColorByKey(DPadControlKey.left),
              size: 60,
            ),
            Icon(
                widget._controller.isPlaying
                    ? Icons.pause_circle_filled_rounded
                    : Icons.play_circle_filled_rounded,
                color: _getColorByKey(DPadControlKey.select),
                size: 60),
            Icon(Icons.arrow_circle_right_rounded,
                color: _getColorByKey(DPadControlKey.right), size: 60),
          ],
        ));
  }

  Color _getColorByKey(DPadControlKey key) {
    Color color;
    if (_focused) {
      if (_keyDowning && key == _downedKey) {
        color = Colors.redAccent;
      } else {
        color = Colors.white;
      }
    } else {
      color = Colors.white54;
    }
    return color;
  }
}

class _AdaptivePlayerProgressBar extends StatefulWidget {
  const _AdaptivePlayerProgressBar(this._controller);

  final AdaptivePlayerController _controller;

  @override
  State<StatefulWidget> createState() => _AdaptivePlayerProgressBarState();
}

class _AdaptivePlayerProgressBarState
    extends State<_AdaptivePlayerProgressBar> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return SimpleDPadFocusTap(
        onFocusChange: (hasFocus) {
          setState(() {
            focused = hasFocus;
          });
        },
        onDPadKey: (type, key, count) {
          if (type == DPadControlKeyEventType.up) {
            if (key == DPadControlKey.left) {
              widget._controller.position.then((position) {
                if (position != null) {
                  widget._controller
                      .seekTo(position + const Duration(seconds: -10));
                }
              });
            } else if (key == DPadControlKey.right) {
              widget._controller.position.then((position) {
                if (position != null) {
                  widget._controller
                      .seekTo(position + const Duration(seconds: 10));
                }
              });
            } else if (key == DPadControlKey.select) {
              if (widget._controller.isPlaying) {
                widget._controller.pause().then((_) => setState(() {}));
              } else {
                widget._controller.play().then((_) => setState(() {}));
              }
            }
          }
        },
        child: _buildProgressBar());
  }

  Widget _buildProgressBar() {
    late Widget w;
    if (widget._controller.type == AdaptivePlayerType.videoPlayer &&
        widget._controller._videoPlayerController != null) {
      w = VideoProgressIndicator(widget._controller._videoPlayerController!,
          colors: focused ? focusedColors : colors, allowScrubbing: true);
    } else if (widget._controller.type == AdaptivePlayerType.dartVlc &&
        widget._controller._vlcPlayer != null) {
      w = Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: StreamBuilder<PositionState>(
          stream: widget._controller._vlcPlayer?.positionStream,
          builder:
              (BuildContext context, AsyncSnapshot<PositionState> snapshot) {
            final PositionState? state = snapshot.data;
            final progress = state?.position ?? Duration.zero;
            final total = state?.duration ?? Duration.zero;
            return LinearProgressIndicator(
              value: total == Duration.zero
                  ? null
                  : progress.inSeconds / total.inSeconds,
              valueColor: AlwaysStoppedAnimation<Color>(colors.playedColor),
              backgroundColor: colors.backgroundColor,
            );
          },
        ),
      );
    } else {
      w = Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(colors.playedColor),
          backgroundColor: colors.backgroundColor,
        ),
      );
    }
    return w;
  }

  static VideoProgressColors colors = VideoProgressColors(
    playedColor: Colors.white70,
    bufferedColor: Colors.blueGrey.shade800,
    backgroundColor: Colors.grey.shade700,
  );

  static VideoProgressColors focusedColors = VideoProgressColors(
    playedColor: Colors.white,
    bufferedColor: Colors.blueGrey.shade800,
    backgroundColor: Colors.grey.shade700,
  );
}
