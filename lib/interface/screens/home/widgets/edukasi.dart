import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../../../models/article.dart';
import './recent/recent_section.dart';
import './category/category_section.dart';
import 'contributors/top_contributors.dart';
import './recently_added.dart';
import '../../mobile/home_mobile/widgets/search_engine.dart';

class Edukasi extends StatelessWidget {
  const Edukasi({
    Key? key,
    required this.listArticle,
  }) : super(key: key);

  final List<Article>? listArticle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // height: size.height * 0.8,
      width: size.width * 2 / 3,
      padding: EdgeInsets.only(
          right: size.width < 950 ? size.width * 1 / 8 : size.width * 1 / 6,
          left: size.width < 950 ? size.width * 1 / 8 : size.width * 1 / 6,
          top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: SizedBox(
              width: size.width < 950
                  ? size.width
                  : size.width * 2 / 3 * 2 / 3 - 20,
              child: Column(
                children: [
                  Flexible(child: RecentSection(listArticle: listArticle)),
                  const SizedBox(
                    height: 15,
                  ),
                  CategorySection(listArticle: listArticle)
                ],
              ),
            ),
          ),
          size.width < 950
              ? const SizedBox()
              : SizedBox(
                  width: size.width * 2 / 3 * 1 / 3 - 20,
                  // height: size.height * 0.9,
                  //  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        onTap: () => showSearch(
                          context: context,
                          delegate: SearchEngine(listArticle),
                        ),
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
                      Flexible(
                          child: TopContributtors(listArticle: listArticle)),
                      const SizedBox(
                        height: 30,
                      ),
                      Flexible(child: RecentlyAdded(listArticle: listArticle)),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
