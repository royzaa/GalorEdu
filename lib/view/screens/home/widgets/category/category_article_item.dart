import 'package:flutter/material.dart';

import '../../../../theme/gradient.dart';

class CategoryArticleItem extends StatelessWidget {
  const CategoryArticleItem(
      {Key? key,
      required this.imageUrl,
      required this.tags,
      required this.title})
      : super(key: key);

  final String imageUrl;
  final String title;
  final String tags;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
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
                          (tag) => FittedBox(
                            child: Card(
                              margin: const EdgeInsets.only(right: 3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 6),
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
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
