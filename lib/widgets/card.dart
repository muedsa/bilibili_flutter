import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:bilibili_flutter/utils.dart';

class SimpleImageCard extends StatelessWidget {
  static const double borderRadius = 12.0;
  static const double padding = 12.0;

  const SimpleImageCard({
    this.direction = Axis.vertical,
    required this.imageUrl,
    this.imageHttpHeaders,
    required this.imageAspectRatio,
    required this.textTitle,
    this.titleMaxLines = 2,
    this.titleStyle,
    required this.textContent,
    this.contentMaxLines = 1,
    this.contentStyle,
    required this.textBoxHeight,
    this.textGapHeight = 0,
    this.backgroundColor = Colors.transparent,
    super.key,
  });

  final Axis direction;
  final String imageUrl;
  final Map<String, String>? imageHttpHeaders;
  final double imageAspectRatio;
  final String textTitle;
  final int titleMaxLines;
  final TextStyle? titleStyle;
  final String textContent;
  final int contentMaxLines;
  final TextStyle? contentStyle;
  final double textBoxHeight;
  final double textGapHeight;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    double titleAspect =
        titleMaxLines / (titleMaxLines + contentMaxLines * 0.8);
    double contentAspect =
        contentMaxLines * 0.8 / (titleMaxLines + contentMaxLines * 0.8);
    return ClipRRect(
        borderRadius: BorderRadius.circular(SimpleImageCard.borderRadius),
        child: Container(
            color: backgroundColor,
            child: Flex(
              direction: direction,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius:
                        BorderRadius.circular(SimpleImageCard.borderRadius),
                    child: AspectRatio(
                        aspectRatio: imageAspectRatio,
                        child: ImageUtils.wrapper(imageUrl, imageHttpHeaders))),
                Padding(
                  padding: const EdgeInsets.all(SimpleImageCard.padding),
                  child: Column(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: titleAspect * textBoxHeight,
                          child: AutoSizeText(
                            textTitle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: titleMaxLines,
                            style: titleStyle,
                            minFontSize: 0,
                          )),
                      textGapHeight > 0
                          ? SizedBox(
                              width: double.infinity, height: textGapHeight)
                          : Container(),
                      SizedBox(
                          width: double.infinity,
                          height: contentAspect * textBoxHeight,
                          child: AutoSizeText(
                            textContent,
                            overflow: TextOverflow.ellipsis,
                            maxLines: contentMaxLines,
                            style: contentStyle,
                            minFontSize: 0,
                          ))
                    ],
                  ),
                )
              ],
            )));
  }
}
