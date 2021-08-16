import 'package:flutter/material.dart';

import '../home/widgets/app_bar.dart' as app_bar;
import './widgets/second_app_bar.dart';
import './widgets/contents.dart';
import '../../footer.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({
    Key? key,
    required this.imageSource,
    required this.imageUrl,
    required this.tags,
    required this.title,
    required this.htmlStory,
    required this.timeStamp,
    required this.author,
    required this.linkYt,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String tags;
  final String imageSource;
  final String htmlStory;
  final String timeStamp;
  final String author;
  final String linkYt;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            size.width < 550 ? const SizedBox() : app_bar.AppBar(size: size),
            SecondAppBar(constraints: size),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            const SizedBox(
              height: 25,
            ),
            Contents(
                linkYt: linkYt,
                constraints: size,
                imageSource: imageSource,
                imageUrl: imageUrl,
                tags: tags,
                title: title,
                htmlStory: htmlStory,
                timeStamp: timeStamp,
                author: author),
            const SizedBox(
              height: 30,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
