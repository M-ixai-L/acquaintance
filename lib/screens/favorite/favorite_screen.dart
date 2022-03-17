import 'package:acquaintance/utils/save/classes/human.dart';
import 'package:acquaintance/utils/values/colors.dart';
import 'package:acquaintance/utils/values/lists.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {


  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar(context),
        body: bodyWidget,
      ),
    );
  }

  Widget get bodyWidget {
    final double sizePicture = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount:  likedList.length,
      itemBuilder: (_, index) => post(index),
    );
  }

  Widget post(int index) {
    final double sizePicture = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 100, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                //show data
                height: sizePicture,
                width: sizePicture,
                child: FittedBox(
                  child: Image.network(
                    likedList[index].picture.medium,
                    cacheHeight: 300,
                    cacheWidth: 300,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  likedList[index].name.first +
                      ', ' +
                      likedList[index].dob.age.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: (){
                  likedList.removeAt(index);
                  setState(() {});
                  },

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: grayColor,
                  ),
                  alignment: Alignment.center,
                  height: 35,
                  width: 200,
                  child: Text(
                    'Dislike',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: accentColor,
      centerTitle: true,
      title: Text('Favorite'),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
