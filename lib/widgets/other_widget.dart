import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({required this.title, this.message, super.key});

  final String title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(title, textAlign: TextAlign.center, style: textTheme.titleLarge),
      message != null
          ? Text(message!,
              textAlign: TextAlign.center, style: textTheme.bodyMedium)
          : Container()
    ])));
  }

  static MessageWidget error = const MessageWidget(title: 'Error');

  static MessageWidget missing = const MessageWidget(
    title: '404',
    message: 'something missed',
  );

  static MessageWidget loading = const MessageWidget(title: 'Loading...');

  static MessageWidget unsupported =
      const MessageWidget(title: 'Unsupported Platform');
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
            width: 20, height: 20, child: CircularProgressIndicator()));
  }
}
