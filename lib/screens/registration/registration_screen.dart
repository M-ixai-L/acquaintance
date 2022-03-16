import 'package:acquaintance/screens/home/home_screen.dart';
import 'package:acquaintance/utils/navigation/navigation.dart';
import 'package:acquaintance/utils/navigation/project_router.dart';
import 'package:acquaintance/utils/save/save_choice.dart';
import 'package:acquaintance/utils/values/colors.dart';
import 'package:acquaintance/utils/values/lists.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with TickerProviderStateMixin {
  String genderValue = "Female";
  String nationalitiesValue = nationalitiesList[0];

  IconData getIcon(String value) =>
      value == 'Male' ? Icons.male : Icons.female_outlined;

  Color getColorIcon(String value) => value == 'Male' ? blueColor : pinkColor;

  int? getIndex() {
    for (int i = 0; i < nationalitiesList.length; i++) {
      if (nationalitiesList[i] == nationalitiesValue) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              width: 250,
              child: const Text(
                'Welcome to the acquaintance app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: grayColor,
                  fontSize: 24,
                ),
              ),
            ),
            Column(
              children: [
                genderWidget,
                nationalitiesWidget,
              ],
            ),
            TextButton(
              onPressed: () {
                Choice? choice = Choice(
                  indexNat: getIndex(),
                  gender: genderValue,
                );
                Navigation.toScreen(
                    Routes.home,
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.yellow,
                ),
                child: const Text(
                  'GO',
                  style: TextStyle(
                    fontSize: 30,
                    color: blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> genderBuildMenu(String item) => DropdownMenuItem(
        value: item,
        child: Row(
          children: [
            Icon(getIcon(item), color: getColorIcon(item)),
            Text(
              item,
              style: const TextStyle(color: blackColor),
            ),
          ],
        ),
      );

  DropdownMenuItem<String> nationalitiesBuildMenu(String item) =>
      DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(color: blackColor),
        ),
      );

  Widget get genderWidget {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Sex',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        DropdownButton<String>(
          value: genderValue,
          alignment: Alignment.centerRight,
          style: const TextStyle(fontSize: 20, color: grayColor),
          onChanged: (String? newValue) {
            setState(() {
              genderValue = newValue!;
            });
          },
          items: <String>['Male', 'Female'].map(genderBuildMenu).toList(),
        ),
      ],
    );
  }

  Widget get nationalitiesWidget {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 5),
          child: const Text(
            'Nationalities',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        DropdownButton<String>(
          value: nationalitiesValue,
          alignment: Alignment.centerRight,
          style: const TextStyle(fontSize: 20, color: grayColor),
          onChanged: (String? newValue) {
            setState(() {
              nationalitiesValue = newValue!;
            });
          },
          items: nationalitiesList.map(nationalitiesBuildMenu).toList(),
        ),
      ],
    );
  }
}
