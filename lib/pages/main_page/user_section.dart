import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSection extends StatefulWidget {
  const UserSection({super.key});

  @override
  State<StatefulWidget> createState() => _UserSectionState();
}

class _UserSectionState extends State<UserSection> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
