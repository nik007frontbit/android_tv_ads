import 'package:flutter/material.dart';

import '../../../models/content_model.dart';

class ContentDetailPage extends StatefulWidget {
  const ContentDetailPage({super.key, required this.content});

  final Content content;

  @override
  State<ContentDetailPage> createState() => _ContentDetailPageState();
}

class _ContentDetailPageState extends State<ContentDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text("Content Page")],
      ),
    );
  }
}
