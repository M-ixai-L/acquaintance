
import 'package:acquaintance/utils/save/save_choice.dart';
import 'package:acquaintance/utils/values/colors.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  final Choice? choice;
  _HomeScreenState({this.choice});

  IconData getIcon(String value) =>
      value == 'Male' ? Icons.male : Icons.female_outlined;

  Color getColorIcon(String value) => value == 'Male' ? blueColor : pinkColor;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBar(context),
      //ody:
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: accentColor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
