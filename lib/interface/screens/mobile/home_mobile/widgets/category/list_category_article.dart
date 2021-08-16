import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../../models/article.dart';
import './article_item.dart';

enum Category { kesehatan, pembelajaran, kreativitas, teknologi, ekonomi }

class ListCategoryArticle extends StatelessWidget {
  const ListCategoryArticle(
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

    return articleCat.isEmpty
        ? const Center(
            child: Text('Belum terdapat artikel tersedia'),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: articleCat.length,
            itemBuilder: (context, index) => ArticleItem(
                margin: EdgeInsets.only(right: 20, left: index == 0 ? 20 : 0),
                linkYt: articleCat[index].linkYt,
                author: articleCat[index].author,
                htmlStory: articleCat[index].storyInHtml,
                imageSource: articleCat[index].imaageSrc,
                timeStamp: articleCat[index].time,
                imageUrl: articleCat[index].imageUrl,
                tags: articleCat[index].tags,
                title: articleCat[index].title),
          );
  }
}
