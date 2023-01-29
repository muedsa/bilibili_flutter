import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bilibili_flutter/data/repository/bilibili.dart';
import 'package:bilibili_flutter/widgets/other_widget.dart';
import 'package:bilibili_flutter/pages/main_page/recommended_video_section.dart';
import 'package:bilibili_flutter/cubit/recommended_video_list_cubit.dart';

class MainPage extends StatefulWidget {
  static const String routeName = 'main';

  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  late final BilibiliRepository repository;

  @override
  void initState() {
    super.initState();
    repository = RepositoryProvider.of<BilibiliRepository>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        NavigationRail(
          groupAlignment: Alignment.center.y,
          destinations: <NavigationRailDestination>[
            NavigationRailDestination(
              icon: const Icon(Icons.home_rounded),
              label: _buildNavLabel('首页'),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.live_tv_rounded),
              label: _buildNavLabel('直播'),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.account_box_rounded),
              label: _buildNavLabel('我的'),
            )
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: _buildContent(_selectedIndex))
      ]),
    );
  }

  Widget _buildContent(int index) {
    late Widget widget;
    switch (index) {
      case 0:
        widget = MultiBlocProvider(
            providers: [
              BlocProvider.value(
                  value: RecommendedVideoListCubit(repository: repository))
            ],
            child: const Padding(
                padding: EdgeInsets.all(8), child: RecommendedVideoSection()));
        break;
      case 1:
      case 2:
      default:
        widget = MessageWidget.missing;
        break;
    }
    return widget;
  }

  Widget _buildNavLabel(String label) {
    return AutoSizeText(
      label,
      maxLines: 1,
    );
  }
}
