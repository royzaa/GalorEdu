import 'package:flutter/material.dart';

import '../../../../theme/gradient.dart';
import '../../../blog _screen/blog_sceen.dart';

class CategoryArticleItem extends StatelessWidget {
  const CategoryArticleItem({
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
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogScreen(
                imageSource: imageSource,
                imageUrl: imageUrl,
                tags: tags,
                title: title,
                htmlStory: htmlStory,
                timeStamp: timeStamp,
                author: author),
          ),
        );
        // print('author: $author');
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              'https://drive.google.com/uc?id=${imageUrl.split("=")[1]}',
              fit: BoxFit.cover,
              width: size.width,
              height: size.height,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              height: size.height * 0.12,
              width: size.width,
              decoration: BoxDecoration(
                gradient: MyGradients.whiteItemGradient,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.height < 700 ? 10 : 12,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...tags.split(',').map(
                            (tag) => Flexible(
                              child: Card(
                                margin: const EdgeInsets.only(right: 3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 6),
                                  child: Expanded(
                                    child: Text(
                                      tag.trim(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 6,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
