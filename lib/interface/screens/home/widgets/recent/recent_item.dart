import 'package:flutter/material.dart';

import '../../../../../models/article.dart';
import '../../../../theme/gradient.dart';

class RecentItem extends StatefulWidget {
  const RecentItem(
      {Key? key,
      required this.listArticle,
      required this.articleIndex,
      required this.tagColor})
      : super(key: key);

  final List<Article?>? listArticle;
  final int articleIndex;
  final Color tagColor;

  @override
  State<RecentItem> createState() => _RecentItemState();
}

class _RecentItemState extends State<RecentItem> {
  String _story = '';

  @override
  void initState() {
    widget.listArticle![widget.articleIndex]!.story
        .split('.')
        .map((e) {
          return e + '.';
        })
        .toList()
        .sublist(0, 3)
        .forEach((e) => _story += e);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String imageUrl =
        'https://drive.google.com/uc?id=${widget.listArticle![widget.articleIndex]!.imageUrl.split("=")[1]}';

    return Container(
        width: size.width * 2 / 3 * 3 / 5 - 20,
        height: size.height * 1 / 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: size.height * 0.3,
                width: size.width * 2 / 3 * 2 / 3 - 20,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.data != 0) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Container(
                    padding: const EdgeInsets.only(
                        bottom: 30, left: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                      gradient: MyGradients.whiteGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...widget.listArticle![widget.articleIndex]!.tags
                                  .split(',')
                                  .map(
                                    (tag) => Card(
                                      margin: const EdgeInsets.only(right: 3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: widget.tagColor,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 8),
                                        child: Text(
                                          tag.trim(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.listArticle![widget.articleIndex]!.title,
                            style: TextStyle(
                              color: widget.tagColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            _story,
                            style: TextStyle(
                                color: widget.tagColor,
                                fontSize: size.height < 700 ? 9 : 11,
                                fontFamily: 'Roboto'),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
              future: Future.delayed(
                  Duration(milliseconds: widget.articleIndex == 0 ? 2000 : 0),
                  () {
                return 0;
              }),
            )
          ],
        ));
  }
}
