import 'package:acquaintance/utils/navigation/navigation.dart';
import 'package:acquaintance/utils/navigation/project_router.dart';
import 'package:flutter/material.dart';
import 'package:acquaintance/utils/save/classes/human.dart';
import 'package:acquaintance/utils/save/classes/result.dart';
import 'package:acquaintance/utils/save/classes/save_choice.dart';
import 'package:acquaintance/utils/values/colors.dart';
import 'package:acquaintance/utils/values/lists.dart';
import 'package:acquaintance/utils/api_client/api_client.dart';

import 'package:flutter_svg/flutter_svg.dart';


class HomeScreen extends StatefulWidget {
  final Choice? choice;

  const HomeScreen({Key? key, this.choice}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  IconData getIcon(String value) =>
      value == 'Male' ? Icons.male : Icons.female_outlined;

  Color getColorIcon(String value) => value == 'Male' ? blueColor : pinkColor;

  Uri getUrl (){
    var url = Uri.parse(
        'https://randomuser.me/api/?inc=name,picture,dob,nat&nat=${saveNationalityList[(widget.choice?.indexNat)!]}&gender=${(widget.choice?.gender)!.toLowerCase()}');
   return url;
  }

  void _openDrawer() => _scaffoldKey.currentState!.openEndDrawer();


  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(context),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            purpleColor,
            redColor,
            pinkColor,
            caramelColor,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: Center(
          child: FutureBuilder(
              future: getApiCallUsingHttp(getUrl()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  if (data is Result) {
                    return bodyWidget(data.results[0]);
                  } else {
                    return const Text('Bind Error');
                  }
                } else if (snapshot.hasError) {
                  return errorNetwork;
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
      endDrawer: drawerRight,
    );
  }

  Drawer get drawerRight {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: const BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Container(
                height: 50,
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: whiteColor,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (likedList.isEmpty) {
                  showSnackBar(context, 'First like at least one questionnaire');
                }  else {
                  Navigation.toScreen(
                    Routes.favorite,
                    arguments: likedList,
                  );
                }

              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    colors: [
                      pinkColor,
                      caramelColor,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: const Text(
                  'Favorite',
                  style: TextStyle(color: whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get errorNetwork {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Error...\nCheck your network connection',
          style: TextStyle(
            color: blackColor,
          ),
        ),
        TextButton(
          onPressed: () => setState(() {}),
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(5),
            ),

            child: const Icon(Icons.refresh_outlined, color: blackColor,)
            ),
          ),

      ],
    );
  }

  Widget bodyWidget(Human data) {
    final double sizePicture = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(//show data
              height: sizePicture,
              width: sizePicture,
              child: FittedBox(
                child: Image.network(
                  data.picture.medium,
                  cacheHeight: 300,
                  cacheWidth: 300,
                ),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                data.name.first +
                    ', ' +
                    data.dob.age.toString() +
                    ', ' +
                    nationalitiesList[(widget.choice?.indexNat)!],
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        actionWidget(data),//liked or skip
      ],
    );
  }

  Widget actionWidget ( Human data){
    double buttonRadius = 70;
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(//skip
            height: buttonRadius,
            width: buttonRadius,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(buttonRadius),
            ),
            child: TextButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(fontSize: 24, color: blackColor),
                )),
          ),
          Container(//liked
            padding: const EdgeInsets.all(5),
            height: buttonRadius,
            width: buttonRadius,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton(
              onPressed: () {
                likedList.add(data);
                setState(() {});
              },
              child: SvgPicture.asset(
                'assets/icons/like_Icon.svg',
                color: redColor,
              ),
            ),
          ),
        ],
      ),
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
          onPressed: _openDrawer,
        ),
      ],
    );
  }
}


