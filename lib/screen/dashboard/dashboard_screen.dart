import 'package:android_tv_ads/data/data.dart';
import 'package:android_tv_ads/models/content_model.dart';
import 'package:android_tv_ads/screen/content_player_screen/content_player_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/separator.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonViewList(contentList: previews, title: "Previews",context: context),
            commonViewList(contentList: myList, title: "My List",context: context),
            commonViewList(contentList: originals, title: "Original",context: context),
            commonViewList(contentList: trending, title: "Trending",context: context),
          ],
        ),
      ),
    );
  }

  Widget commonViewList({required List<Content> contentList, required String title, required BuildContext context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: MaterialButton(
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContentPlayerScreen(contentList: contentList),
                      ));
                },
                child: const Text(
                  "Play",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: contentList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Content content = contentList[index];
                    return MaterialButton(
                      onPressed: () {},
                      child: Container(
                        height: 300,
                        width: 200,
                        margin: const EdgeInsets.all(4),
                        color: index % 2 == 0 ? Colors.lightBlueAccent : Colors.green,
                        child: Image.asset(
                          content.imageUrl,
                          height: 250,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const Separator()
      ],
    );
  }
}
