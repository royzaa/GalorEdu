import 'package:flutter/material.dart';

import 'grid_category_articles.dart';
import '../../../../../models/article.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key, required this.listArticle})
      : super(key: key);

  final List<Article>? listArticle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      child: SizedBox(
        width: size.width * 2 / 3 * 3 / 5 - 30,
        // height: size.height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TabBar(
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              unselectedLabelStyle:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              tabs: [
                Tab(
                  text: 'Kesehatan',
                ),
                Tab(
                  text: 'Pembelajaran',
                ),
                Tab(
                  text: 'Kreativitas',
                ),
                Tab(
                  text: 'Ekonomi',
                ),
                Tab(
                  text: 'Teknologi',
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: size.width * 2 / 3 * 2 / 3 - 20,
              height: size.height * 0.8,
              child: TabBarView(
                children: [
                  GridCategoryArticles(
                      listArticle: listArticle, category: Category.kesehatan),
                  GridCategoryArticles(
                      listArticle: listArticle,
                      category: Category.pembelajaran),
                  GridCategoryArticles(
                      listArticle: listArticle, category: Category.kreativitas),
                  GridCategoryArticles(
                      listArticle: listArticle, category: Category.ekonomi),
                  GridCategoryArticles(
                      listArticle: listArticle, category: Category.pembelajaran)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
