import 'package:flutter/material.dart';

import '../../../../../models/article.dart';
import '../../../blog _screen/blog_sceen.dart';

class SearchEngine extends SearchDelegate {
  SearchEngine(this.listArticle);

  final List<Article>? listArticle;

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, '');
            } else {
              query = '';
              showSuggestions(context);
            }
          },
          icon: const Icon(Icons.clear),
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, ''),
        icon: const Icon(Icons.arrow_back_rounded),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> listTitle =
        listArticle!.map((article) => article.title).toList();

    final List<String> suggestion = query.isEmpty
        ? []
        : listTitle.where((article) {
            return article.toLowerCase().contains(query.toLowerCase());
          }).toList();

    return buildSuggestionsSuccess(suggestion);
  }

  Widget buildSuggestionsSuccess(List<String> suggestions) {
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          List<Article> searchedItem = [];

          for (var item in suggestions) {
            searchedItem.add(listArticle!.firstWhere((article) =>
                article.title.toLowerCase() == item.toLowerCase()));
          }

          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlogScreen(
                      imageSource: searchedItem[index].imaageSrc,
                      imageUrl: searchedItem[index].imageUrl,
                      tags: searchedItem[index].tags,
                      title: searchedItem[index].title,
                      htmlStory: searchedItem[index].storyInHtml,
                      timeStamp: searchedItem[index].time,
                      author: searchedItem[index].author,
                      linkYt: searchedItem[index].linkYt),
                ),
              );
            },
            title: Text(
              suggestions[index],
              style: const TextStyle(fontSize: 12),
            ),
          );
        });
  }

  // implementasi tidak terpakai
  @override
  Widget buildResults(BuildContext context) => const SizedBox();
}
