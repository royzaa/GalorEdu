import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../models/article.dart';
import './category_article_item.dart';

enum Category { kesehatan, pembelajaran, kreativitas, teknologi, ekonomi }

class GridCategoryArticles extends StatelessWidget {
  const GridCategoryArticles(
      {Key? key, required this.listArticle, required this.category})
      : super(key: key);

  final List<Article>? listArticle;
  final Category category;

  @override
  Widget build(BuildContext context) {
    List<Article> getArticleByCategory(String cat) => listArticle!
        .where((article) => article.topic.toLowerCase() == cat.toLowerCase())
        .toList();
    List<Article> articleCat = [];

    switch (category) {
      case Category.ekonomi:
        articleCat = getArticleByCategory('ekonomi');
        break;
      case Category.kesehatan:
        articleCat = getArticleByCategory('kesehatan');
        break;
      case Category.kreativitas:
        articleCat = getArticleByCategory('kreativitas');
        break;
      case Category.pembelajaran:
        articleCat = getArticleByCategory('pembelajaran');
        break;
      case Category.teknologi:
        articleCat = getArticleByCategory('teknologi');
        break;
      default:
    }

    return listArticle!.isEmpty
        ? const Center(
            child: Text('Belum terdapat artikel tersedia'),
          )
        : StaggeredGridView.countBuilder(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            itemCount: articleCat.length,
            itemBuilder: (context, index) => CategoryArticleItem(
                imageUrl: articleCat[index].imageUrl,
                tags: articleCat[index].tags,
                title: articleCat[index].title),
            staggeredTileBuilder: (index) => (index + 1) % 4 == 0
                ? const StaggeredTile.count(2, 1)
                : const StaggeredTile.count(1, 1),
          );
  }
}
