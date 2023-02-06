import 'dart:io';

import 'package:bilibili_flutter/data/model/video_play_info.dart';
import 'package:bilibili_flutter/data/repository/bilibili.dart';
import 'package:bilibili_flutter/data/service/api_client.dart';
import 'package:bilibili_flutter/data/service/provider/bilibili_provider.dart';
import 'package:bilibili_flutter/pages/main_page/main_page.dart';
import 'package:bilibili_flutter/pages/player_page.dart';
import 'package:bilibili_flutter/widgets/d_pad_control_focus.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    DartVLC.initialize();
  }
  runApp(_initMyApp());
}

Widget _initMyApp() {
  HttpApiClient httpApiClient = HttpApiClient();
  final BilibiliProvider bilibiliProvider = BilibiliProvider(httpApiClient);
  final BilibiliRepository bilibiliRepository =
      BilibiliRepository(bilibiliProvider);

  return MultiRepositoryProvider(providers: [
    RepositoryProvider<BilibiliRepository>(
        create: (context) => bilibiliRepository)
  ], child: const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DPadControlShortcuts(
        child: MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[850],
        fontFamily: 'Sans-serif',
      ),
      initialRoute: MainPage.routeName,
      routes: {
        MainPage.routeName: (context) => const MainPage(),
        BilibiliVideoPlayerPage.routeName: (context) {
          return BilibiliVideoPlayerPage(
              videoPlayInfo:
                  ModalRoute.of(context)!.settings.arguments as VideoPlayInfo);
        }
      },
    ));
  }
}
