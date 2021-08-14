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
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogScreen(
                linkYt: linkYt,
                imageSource: imageSource,
                imageUrl: imageUrl,
                tags: tags,
                title: title,
                htmlStory: htmlStory,
                timeStamp: timeStamp,
                author: author),
          ),
        );
        debugPrint('link: $linkYt');
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
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            height: size.height * 0.15,
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
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Row(
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
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Text(
                                      tag.trim(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.width < 1200 ? 6 : 8,
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
