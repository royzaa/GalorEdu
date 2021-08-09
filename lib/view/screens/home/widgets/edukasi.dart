import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../../../models/article.dart';
import './recent/recent_section.dart';
import './category/category_section.dart';
import 'contributors/top_contributors.dart';
import './recently_added.dart';

class Edukasi extends StatelessWidget {
  Edukasi({
    Key? key,
    required this.listArticle,
  }) : super(key: key);

  final List<Article>? listArticle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.8,
      width: size.width * 2 / 3,
      padding: EdgeInsets.only(
          right: size.width * 1 / 6, left: size.width * 1 / 6, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: size.height * 0.8,
              width: size.width * 2 / 3 * 2 / 3 - 20,
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RecentSection(listArticle: listArticle),
                  const SizedBox(
                    height: 15,
                  ),
                  CategorySection(listArticle: listArticle)
                ],
              ),
            ),
          ),
          Container(
            width: size.width * 2 / 3 * 1 / 3 - 20,
            height: size.height * 0.9,
            padding: const EdgeInsets.only(top: 15),
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    fillColor: Colors.white,
                    filled: true,
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TopContributtors(listArticle: listArticle),
                const SizedBox(
                  height: 30,
                ),
                RecentlyAdded(listArticle: listArticle)
              ],
            ),
          )
        ],
      ),
    );
  }
}
