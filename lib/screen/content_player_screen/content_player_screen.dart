import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/content_model.dart';

class ContentPlayerScreen extends StatefulWidget {
  ContentPlayerScreen({Key? key, required this.contentList}) : super(key: key);
  final List<Content> contentList;

  @override
  State<ContentPlayerScreen> createState() => _ContentPlayerScreenState();
}

class _ContentPlayerScreenState extends State<ContentPlayerScreen> {
  PageController pageController = PageController();
  Timer? pageScrollTimer;
  final random = Random();

  @override
  void initState() {
    super.initState();

    startRandomScrolling(0);
  }

  @override
  void dispose() {
    pageScrollTimer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  void startRandomScrolling(int previousIndex) {
    int contentTime = random.nextInt(10) + 1;
    pageScrollTimer = Timer.periodic(Duration(seconds: contentTime), (timer) {
      widget.contentList[previousIndex].adCount += 1;
      dev.log(
          "\n{\nContent Name: ${widget.contentList[previousIndex].name},\nCurrent Time: ${DateTime.now().toIso8601String()},\nContent Play Time(Second):$contentTime,\nAd Count:${widget.contentList[previousIndex].adCount}\n}");
      int nextPage;
      do {
        nextPage = random.nextInt(widget.contentList.length);
      } while (nextPage == previousIndex);

      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      // Cancel and restart the timer with a new random interval
      pageScrollTimer?.cancel();
      startRandomScrolling(nextPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: widget.contentList.length,
              itemBuilder: (context, index) {
                Content content = widget.contentList[index];
                return Image.asset(
                  content.imageUrl,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
