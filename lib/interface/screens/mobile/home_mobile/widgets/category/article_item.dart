import 'package:flutter/material.dart';

import '../../../../../theme/gradient.dart';
import '../../../../../Theme/drop_shadow_theme.dart';
import '../../../../blog _screen/blog_sceen.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem(
      {Key? key,
      required this.imageSource,
      required this.imageUrl,
      required this.tags,
      required this.title,
      required this.htmlStory,
      required this.timeStamp,
      required this.author,
      required this.linkYt,
      required this.margin})
      : super(key: key);

  final String imageUrl;
  final String title;
  final String tags;
  final String imageSource;
  final String htmlStory;
  final String timeStamp;
  final String author;
  final String linkYt;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(boxShadow: [DropShadowTheme.appBar]),
      margin: margin,
      child: InkWell(
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
                    author: author,
                    linkYt: linkYt)),
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
                width: size.width * 3 / 5,
                height: size.height,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              height:
                  size.height < 770 ? size.height * 0.3 : size.height * 0.15,
              width: size.width * 3 / 5,
              decoration: BoxDecoration(
                gradient: MyGradients.whiteItemGradient,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
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
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
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
      ),
    );
  }
}
