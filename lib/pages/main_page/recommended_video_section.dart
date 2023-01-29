import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bilibili_flutter/pages/video_card.dart';
import 'package:bilibili_flutter/widgets/card.dart';
import 'package:bilibili_flutter/cubit/recommended_video_list_cubit.dart';
import 'package:bilibili_flutter/data/model/recommended_video.dart';
import 'package:bilibili_flutter/widgets/other_widget.dart';

class RecommendedVideoSection extends StatefulWidget {
  const RecommendedVideoSection({super.key});

  @override
  State<StatefulWidget> createState() => _RecommendedVideoSectionState();
}

class _RecommendedVideoSectionState extends State<RecommendedVideoSection> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RecommendedVideoListCubit>(context)
        .loadRecommendedVideoList();
    return BlocConsumer<RecommendedVideoListCubit, List<RecommendedVideo>>(
        builder: (context, state) {
          if(state.isEmpty){
            return const LoadingWidget();
          }
          ThemeData themeData = Theme.of(context);
          TextStyle? titleStyle = themeData.textTheme.titleSmall;
          TextStyle? contentStyle = themeData.textTheme.bodySmall;
          return LayoutBuilder(builder: (context, constraintType) {
            int crossAxisCount = MediaQuery.of(context).size.aspectRatio > 1 ? 3 : 2;
            double maxCrossAxisExtent = constraintType.maxWidth / crossAxisCount;
            double gap = 8.0;
            double childWidth = maxCrossAxisExtent - gap * 2;
            double childAspectRatio = 1.2;
            double childHeight = childWidth / childAspectRatio;
            double textBoxHeight = childHeight - childWidth / VideoCard.coverAspectRatio - SimpleImageCard.padding * 2;
            List<Widget> children = state.map((recommendedVideo) {
              return VideoCard(
                bv: recommendedVideo.bv,
                coverUrl: recommendedVideo.coverUrl,
                title: recommendedVideo.title,
                titleStyle: titleStyle,
                author: recommendedVideo.author,
                authorStyle: contentStyle,
                textBoxHeight: textBoxHeight,
              );
            }).toList();
            return GridView.count(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: gap,
                crossAxisSpacing: gap,
                childAspectRatio: childAspectRatio,
                shrinkWrap: true,
                children: children);
          });
        },
        listener: (context, state) {});
  }
}
