import 'package:flutter/material.dart';

import '../home/widgets/app_bar.dart' as app_bar;
import './widgets/second_app_bar.dart';
import './widgets/contents.dart';

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
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String tags;
  final String imageSource;
  final String htmlStory;
  final String timeStamp;
  final String author;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            app_bar.AppBar(size: size),
            SecondAppBar(constraints: size),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            const SizedBox(
              height: 25,
            ),
            Contents(
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
            Container(
              color: Colors.black87,
              width: size.width,
              height: size.height * 0.15,
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green),
                  child: const Text(
                    'Purbalingga Lor - 2021',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
